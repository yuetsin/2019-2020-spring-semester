/*
 * Copyright (c) 2020 Institute of Parallel And Distributed Systems (IPADS), Shanghai Jiao Tong University (SJTU)
 * OS-Lab-2020 (i.e., ChCore) is licensed under the Mulan PSL v1.
 * You can use this software according to the terms and conditions of the Mulan PSL v1.
 * You may obtain a copy of Mulan PSL v1 at:
 *   http://license.coscl.org.cn/MulanPSL
 *   THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER EXPRESS OR
 *   IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR FIT FOR A PARTICULAR
 *   PURPOSE.
 *   See the Mulan PSL v1 for more details.
 */

#include <common/types.h>
#include <process/thread.h>
#include <mm/vmspace.h>
#include <common/types.h>
#include <lib/errno.h>

#include <common/kprint.h>
#include <common/util.h>
#include <common/macro.h>
#include <common/mm.h>
#include <common/kmalloc.h>

#include "esr.h"

static inline vaddr_t get_fault_addr()
{
	vaddr_t addr;
	asm volatile("mrs %0, far_el1\n\t"
				 : "=r"(addr));
	return addr;
}

int handle_trans_fault(struct vmspace *vmspace, vaddr_t fault_addr);

void do_page_fault(u64 esr, u64 fault_ins_addr)
{
	// kinfo("esr: %u, fault_ins_addr: %p\n", esr, fault_ins_addr);

	vaddr_t fault_addr;
	int fsc; // fault status code

	fault_addr = get_fault_addr();

	// kinfo("fault_addr: %p\n", fault_addr);
	fsc = GET_ESR_EL1_FSC(esr);
	switch (fsc)
	{
	case DFSC_TRANS_FAULT_L0:
	case DFSC_TRANS_FAULT_L1:
	case DFSC_TRANS_FAULT_L2:
	case DFSC_TRANS_FAULT_L3:
	{
		int ret;

		ret = handle_trans_fault(current_thread->vmspace, fault_addr);
		if (ret != 0)
		{
			kinfo("pgfault at 0x%p failed\n", fault_addr);
			sys_exit(ret);
		}
		break;
	}
	default:
		kinfo("do_page_fault: fsc is unsupported (0x%b) now\n", fsc);
		BUG_ON(1);
		break;
	}
}

int handle_trans_fault(struct vmspace *vmspace, vaddr_t fault_addr)
{
	struct vmregion *vmr;
	struct pmobject *pmo;
	paddr_t pa;

	/*
	 * Lab3: your code here
	 * In this function, you should:
	 * 1. Get the vmregion of the fault_addr using find_vmr_for_va
	 * 2. If the pmo is not of type PMO_ANONYM, return -ENOMAPPING
	 * 3. Allocate one physical memory page for the PMO
	 * 4. Map the allocated address back to the page table
	 *
	 * NOTE: when any problem happened in this function, return
	 * -ENOMAPPING
	 */
	// kinfo("handle_trans_fault called! vmspace: %p, fault_addr: %p\n", vmspace, fault_addr);

	vmr = find_vmr_for_va(vmspace, fault_addr);
	if (!vmr)
	{
		return -ENOMAPPING;
	}

	// kinfo("found vmr = %p\n", vmr);

	pmo = vmr->pmo;

	// kinfo("found pmo->type = %d, expected %d\n", pmo->type, PMO_ANONYM);
	if (pmo->type != PMO_ANONYM)
	{
		return -ENOMAPPING;
	}

	pa = (paddr_t)virt_to_phys(kzalloc(PAGE_SIZE));
	vmr_prop_t flags = (u64)0;

	flags |= VMR_READ;
	flags |= VMR_WRITE;
	flags |= VMR_EXEC;

	// kinfo("pgtbl: %p\n", vmspace->pgtbl);

	int ret = map_range_in_pgtbl(vmspace->pgtbl, fault_addr, pa, PAGE_SIZE, flags);

	if (ret != 0)
	{
		return -ENOMAPPING;
	}

	// kinfo("fixed pgtbl, now.\n");
	return 0;
}
