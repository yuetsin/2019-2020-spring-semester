#include "tmpfs_server.h"

#include <syscall.h>

// int fs_stat(const char *pathname, struct stat *statbuf);
// int fs_getdents(int fd, struct dirent *dirp, size_t count);

int fs_server_init(u64 cpio_start)
{
    init_tmpfs();
    usys_fs_load_cpio(cpio_start);
    return tfs_load_image((char*)cpio_start);
}

int fs_server_mkdir(const char* path, mode_t mode)
{
    struct inode* dirat = NULL;
    const char* leaf = path;
    int err;

    BUG_ON(!path);
    BUG_ON(*path != '/');
    WARN_ON(mode, "mode is ignored by fs_server_mkdir");

    // TODO(Lab5): your code here

    return err;
}

int fs_server_creat(const char* path, mode_t mode)
{
    struct inode* dirat = NULL;
    const char* leaf = path;
    int err;

    BUG_ON(!path);
    BUG_ON(*path != '/');
    WARN_ON(mode, "mode is ignored by fs_server_creat");

    // TODO(Lab5): your code here

    return err;
}

int fs_server_unlink(const char* path)
{
    struct inode* dirat = NULL;
    const char* leaf = path;
    int err;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    // TODO(Lab5): your code here

    return err;
}

int fs_server_rmdir(const char* path)
{
    struct inode* dirat = NULL;
    const char* leaf = path;
    int err;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    // TODO(Lab5): your code here

    return err;
}

/* use absolute path, offset and count to read directly */
int fs_server_read(const char* path, off_t offset, void* buf, size_t count)
{
    struct inode* inode;
    int ret = -ENOENT;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    // TODO(Lab5): your code here

    return ret;
}

/* use absolute path, offset and count to write directly */
int fs_server_write(const char* path, off_t offset, const void* buf, size_t count)
{
    struct inode* inode;
    int ret = -ENOENT;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    // TODO(Lab5): your code here

    return ret;
}

ssize_t fs_server_get_size(const char* path)
{
    struct inode* inode;
    int ret = -ENOENT;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    inode = tfs_open_path(path);
    if (inode)
        ret = inode->size;
    return ret;
}

static int fs_server_open(const char* path, int flags, mode_t mode)
{
    return -ESUPPORT;
}

static int fs_server_close(int fd)
{
    return -ESUPPORT;
}

/* Scan several dirent structures from the directory referred to by the path
 * into the buffer pointed by dirp. The argument count specifies the size of
 * that buffer.
 *
 * RETURN VALUE
 * On success, the number of items is returned. On end of directory, 0 is
 * returned. On error, -errno is returned.
 *
 * The caller should call this function over and over again until it returns 0
 * */
int fs_server_scan(const char* path, unsigned int start, void* buf, unsigned int count)
{
    struct inode* inode;

    BUG_ON(!path);
    BUG_ON(*path != '/');

    inode = tfs_open_path(path);
    if (inode) {
        if (inode->type == FS_DIR)
            return tfs_scan(inode, start, buf, buf + count);
        return -ENOTDIR;
    }
    return -ENOENT;
}
