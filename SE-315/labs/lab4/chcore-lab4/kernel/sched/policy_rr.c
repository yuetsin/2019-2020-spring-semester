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
/* Scheduler related functions are implemented here */
#include <sched/sched.h>
#include <common/smp.h>
#include <common/kprint.h>
#include <lib/machine.h>
#include <common/kmalloc.h>
#include <common/list.h>
#include <common/util.h>
#include <process/thread.h>
#include <common/macro.h>
#include <lib/errno.h>
#include <process/thread.h>
#include <exception/irq.h>
#include <sched/context.h>

/* in arch/sched/idle.S */
void idle_thread_routine(void);

/*
 * rr_ready_queue
 * Per-CPU ready queue for ready tasks.
 */
struct list_head rr_ready_queue[PLAT_CPU_NUM];
/*
 * RR policy also has idle threads.
 * When no active user threads in ready queue,
 * we will choose the idle thread to execute.
 * Idle thread will **NOT** be in the RQ.
 */
struct thread idle_threads[PLAT_CPU_NUM];

/*
 * Lab 4
 * Sched_enqueue
 * Put `thread` at the end of ready queue of assigned `affinity`.
 * If affinity = NO_AFF, assign the core to the current cpu.
 * If the thread is IDLE thread, do nothing!
 * Do not forget to check if the affinity is valid!
 */
int rr_sched_enqueue(struct thread *thread)
{
	// printk("rr_sched_enqueue called with:\n");
	// print_thread(thread);
	if (!thread || !thread->thread_ctx)
	{
		return -1;
	}

	thread->node.thread = thread;

	u32 affinity = thread->thread_ctx->affinity;
	if (thread->thread_ctx->type == TYPE_IDLE)
	{
		// idle thread? ignore it.
		return 0;
	}
	else if (thread->thread_ctx->state == TS_READY)
	{
		// it's already an enqueued thread!
		return -3;
	}
	else if (affinity == NO_AFF)
	{
		u32 cpu_id = smp_get_cpu_id();
		list_append(&thread->node, &rr_ready_queue[cpu_id]);
		thread->thread_ctx->cpuid = cpu_id;
	}
	else
	{
		if (affinity < PLAT_CPU_NUM)
		{
			list_append(&thread->node, &rr_ready_queue[affinity]);
			thread->thread_ctx->cpuid = affinity;
		}
		else
		{
			// printk("BUG: bad affinity given to rr_sched_enqueue!\n");
			return -4;
		}
	}
	thread->thread_ctx->state = TS_READY;
	return 0;
}

/*
 * Lab 4
 * Sched_dequeue
 * remove `thread` from its current residual ready queue
 * Do not forget to add some basic parameter checking
 */
int rr_sched_dequeue(struct thread *thread)
{
	// printk("rr_sched_dequeue called with:\n");
	// print_thread(thread);
	if (!thread || !thread->thread_ctx)
	{
		return -1;
	}

	thread->node.thread = thread;

	if (thread->thread_ctx->type == TYPE_IDLE || thread->thread_ctx->state != TS_READY)
	{
		// reject dequeuing an idle thread
		return -2;
	}

	thread->thread_ctx->state = TS_INTER;

	list_del(&thread->node);
	return 0;
}

/*
 * Lab 4
 * The helper function
 * Choose an appropriate thread and dequeue from ready queue
 * 
 * If there is no ready thread in the current CPU's ready queue, 
 * choose the idle thread of the CPU.
 * 
 * Do not forget to check the type and 
 * state of the chosen thread
 */
struct thread *rr_sched_choose_thread(void)
{
	// printk("called rr_sched_choose_thread\n");
	u32 cpu_id = smp_get_cpu_id();
	if (list_empty(&rr_ready_queue[cpu_id]))
	{
		// printk("list is empty!\n");
		return &idle_threads[cpu_id];
	}
	// printk("list isn't empty!\n");

	struct list_head *head = &rr_ready_queue[cpu_id];
	struct list_head *node = head->next;

	while (head != node)
	{
		struct thread *target = node->thread;
		if (target->thread_ctx->state == TS_READY && target->thread_ctx->type != TYPE_IDLE)
		{
			rr_sched_dequeue(target);
			return target;
		}
	}
	return &idle_threads[cpu_id];
}

/*
 * Lab 4
 * Schedule a thread to execute.
 * This function will suspend current running thread, if any, and schedule
 * another thread from `rr_ready_queue[cpu_id]`.
 * 
 * Hints:
 * Macro DEFAULT_BUDGET defines the value for resetting thread's budget.
 * After you get one thread from rr_sched_choose_thread, pass it to
 * switch_to_thread() to prepare for switch_context().
 * Then ChCore can call eret_to_thread() to return to user mode.
 */
int rr_sched(void)
{
	// printk("called rr_sched\n");
	if (current_thread && current_thread->thread_ctx->type != TYPE_IDLE)
	{
		rr_sched_enqueue(current_thread);
	}

	struct thread *target = rr_sched_choose_thread();
	target->thread_ctx->sc->budget = DEFAULT_BUDGET;
	switch_to_thread(target);

	// printk("rr_sched choose this: \n");
	// print_thread(target);
	return 0;
}

/*
 * Initialize the per thread queue and idle thread.
 */
int rr_sched_init(void)
{
	// printk("called rr_sched_init\n");
	int i = 0;

	/* Initialize global variables */
	for (i = 0; i < PLAT_CPU_NUM; i++)
	{
		current_threads[i] = NULL;
		init_list_head(&rr_ready_queue[i]);
	}

	/* Initialize one idle thread for each core and insert into the RQ */
	for (i = 0; i < PLAT_CPU_NUM; i++)
	{
		/* Set the thread context of the idle threads */
		BUG_ON(!(idle_threads[i].thread_ctx = create_thread_ctx()));
		/* We will set the stack and func ptr in arch_idle_ctx_init */
		init_thread_ctx(&idle_threads[i], 0, 0, MIN_PRIO, TYPE_IDLE, i);
		/* Call arch-dependent function to fill the context of the idle
		 * threads */
		arch_idle_ctx_init(idle_threads[i].thread_ctx,
						   idle_thread_routine);
		/* Idle thread is kernel thread which do not have vmspace */
		idle_threads[i].vmspace = NULL;
	}
	kdebug("Scheduler initialized. Create %d idle threads.\n", i);

	return 0;
}

/*
 * Lab 4
 * Handler called each time a timer interrupt is handled
 * Do not forget to call sched_handle_timer_irq() in proper code location.
 */
void rr_sched_handle_timer_irq(void)
{
	rr_sched();
}

struct sched_ops rr = {
	.sched_init = rr_sched_init,
	.sched = rr_sched,
	.sched_enqueue = rr_sched_enqueue,
	.sched_dequeue = rr_sched_dequeue,
	.sched_choose_thread = rr_sched_choose_thread,
	.sched_handle_timer_irq = rr_sched_handle_timer_irq,
};
