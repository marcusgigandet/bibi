.syntax unified
.cpu cortex-m4
.thumb

/* Configure the vector table for our supported ISRs. */
.section .vectors, "a", %progbits
.align 2
.global vector_table
.type vector_table, %object
vector_table:
    .word __stack_top
    .word Reset_Handler
    .word Default_Handler /* NMI */
    .word Default_Handler /* HardFault */
    .word Default_Handler /* MemManage */
    .word Default_Handler /* BusFault */
    .word Default_Handler /* UsageFault */
    .word 0
    .word 0
    .word 0
    .word 0
    .word Default_Handler /* SVC */
    .word Default_Handler /* DebugMon */
    .word 0
    .word Default_Handler /* PendSV */
    .word Default_Handler /* SysTick */
.size vector_table, . - vector_table

/* Configure the Reset_Handler */
.section .text.Reset_Handler, "ax", %progbits
.align 2
.global Reset_Handler
.type Reset_Handler, %function
.thumb_func
Reset_Handler:
    /* Copy initialized objects from code flash to SRAM. */
    ldr r0, =__data_load
    ldr r1, =__data_start
    ldr r2, =__data_end
1:
    cmp r1, r2                  /* Have we reached the end of .data? */
    bcs 2f                      /* If r1 >= r2, .data copy is finished and we jump to 2 */
    ldr r3, [r0], #4            /* Load 32-bit word from [r0] into r3, then increment r0 by 4 bytes */

    str r3, [r1], #4            /* Store 32-bit word into [r1], then increment r1 by 4 bytes */

    b 1b                        /* Repeat the .data copy loop */

    /* Clear zero-initialized objects. */
2:
    ldr r0, =__bss_start
    ldr r1, =__bss_end
    movs r2, #0                 /* Set r2 = 0 for clearing data in the .bss section */
3:
    cmp r0, r1                  /* Have we reached the end of .bss? */
    bcs 4f                      /* If r0 >= r1, clearing of .bss section is finished an we jump to 4 */
    str r2, [r0], #4            /* Store r2 (0x0) in r0, then increment r0 by 4 bytes */
    b 3b                        /* Repeat the .bss clear loop */

4:
    bl main
    b Default_Handler
.size Reset_Handler, . - Reset_Handler

/* Default handler for any unimplemented exceptions. */
.section .text.Default_Handler, "ax", %progbits
.align 2
.global Default_Handler
.weak Default_Handler
.type Default_Handler, %function
.thumb_func
Default_Handler:
    cpsid i     /* Disable IRQ interrupts */
5:
    wfi         /* Wait for interrupt, aka enter low-power waiting state */
    b 5b        /* Repeat the loop */
.size Default_Handler, . - Default_Handler
