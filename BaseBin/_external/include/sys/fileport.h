#ifndef _SYS_FILEPORT_H_
#define _SYS_FILEPORT_H_

#include <sys/cdefs.h>
#include <mach/port.h>

typedef mach_port_t fileport_t;
#define FILEPORT_NULL MACH_PORT_NULL

__BEGIN_DECLS

int fileport_makeport(int fd, fileport_t *portp);
int fileport_makefd(fileport_t port);

__END_DECLS

#endif /* _SYS_FILEPORT_H_ */
