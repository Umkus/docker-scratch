#include <sys/syscall.h>
void _start() {
    syscall(SYS_exit, 0);
}
