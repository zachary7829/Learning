//
//  main.c
//  corefoundation-wecewce
//
//  Created by Zachary Keffaber on 4/3/22.
//

#include <stdio.h>
#include <stdlib.h>
#include <bootstrap.h>
#include <mach/mach.h>
#include <mach/message.h>
#include <mach/mach_vm.h>
#include <IOKit/IOKitLib.h>
#include <sys/types.h>
#include <mach/clock.h>
#include <sys/time.h>
#include <mach/mach_error.h>
#include <unistd.h>
#include <mach/mach_traps.h>
#include <fcntl.h>
#include <mach/mach_vm.h>
#include <sys/wait.h>
#include <IOKit/iokitmig.h>
#include <sys/mman.h>

#define SOME_CHAR 'A'

#define LOG(str, args...) do { printf(str "\n", ##args); } while(0)

const uint32_t IOSURFACE_UC_TYPE             =  0;

int main(){
    kern_return_t kr;
    mach_vm_address_t address;
    mach_vm_size_t size = (mach_vm_size_t)vm_page_size;
    vm_offset_t local_address;
    mach_msg_type_number_t local_size = vm_page_size;
    mach_port_t res = MACH_PORT_NULL, master = MACH_PORT_NULL;
    io_service_t service = MACH_PORT_NULL;
    io_connect_t client  = MACH_PORT_NULL;
    io_iterator_t iter = 0;
    CFDictionaryRef match = NULL;
    
    kr = mach_vm_allocate(mach_task_self(), &address, size, VM_FLAGS_ANYWHERE);
        if (kr != KERN_SUCCESS) {
            mach_error("vm_allocate:", kr);
            exit(1);
        }
    // color it with something
    memset((char *)address, SOME_CHAR, vm_page_size);
    
    // display the address so the master can read/write to it
    printf("pid=%d, address=%p\n", getpid(), (void *)address);

    kr = mach_vm_read(mach_task_self(), address, size, &local_address, &local_size);

    // display some of the memory we read from the target task
    printf("read %u bytes from address %p in target task, first byte=%c\n",
    local_size, (void *)address, *(char *)local_address);

    // change some of the memory
    *(char *)local_address = 'B';

        // write it back to the target task
    kr = mach_vm_write(mach_task_self(), address, local_address, local_size);
    
    mach_vm_read(mach_task_self(), address, size, &local_address, &local_size);
    
    if (*(char *)address == 'B') {
        printf("Memory is B\n");
    }
    
    mach_vm_deallocate(mach_task_self(), address, size);
    
    service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOSurfaceRoot"));
    LOG("service: %x", service);
    
    kr = IOServiceOpen(service, mach_task_self(), IOSURFACE_UC_TYPE, &client);
    LOG("client: %x, %s", client, mach_error_string(kr));
    
    exit(0);
}
