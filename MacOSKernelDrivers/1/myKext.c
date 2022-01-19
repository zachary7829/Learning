//
//  myKext.c
//  myKext
//
//  Created by Zachary Keffaber on 1/18/22.
//

//stolen from apple documentation

#include <sys/systm.h>
#include <mach/mach_types.h>

kern_return_t myKext_start(kmod_info_t * ki, void *d);
kern_return_t myKext_stop(kmod_info_t *ki, void *d);

kern_return_t myKext_start(kmod_info_t * ki, void *d)
{
    printf("MyKext has started.\n");
    return KERN_SUCCESS;
}

kern_return_t myKext_stop(kmod_info_t *ki, void *d)
{
    printf("MyKext has stopped.\n");
    return KERN_SUCCESS;
}
