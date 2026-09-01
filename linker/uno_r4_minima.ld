ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x00000000, LENGTH = 256K /* 0x00000000 - 0x00040000 */
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 32K  /* 0x20000000 - 0x20008000 */
}

__stack_top = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
    .vectors ORIGIN(FLASH) :
    {
        __vector_table = .;
        KEEP(*(.vectors))
    } > FLASH

    .text :
    {
        *(.text .text.*)
        *(.rodata .rodata.*)
        . = ALIGN(4);
    } > FLASH

    .data :
    {
        /* .data start address */
        . = ALIGN(4);
        __data_start = .;

        *(.data .data.*)

        /* .data end address */
        . = ALIGN(4);
        __data_end = .;
    } > RAM AT > FLASH
    __data_load = LOADADDR(.data);

    .bss (NOLOAD) :
    {
        /* .bss start address */
        . = ALIGN(4);
        __bss_start = .;

        *(.bss .bss.*)
        *(COMMON)

        /* .bss end address */
        . = ALIGN(4);
        __bss_end = .;
    } > RAM

    .noinit (NOLOAD) :
    {
        /* .noinit start address */
        . = ALIGN(4);
        __noinit_start = .;

        *(.noinit .noinit.*)
        
        /* .noinit end address */
        . = ALIGN(4);
        __noinit_end = .;
    } > RAM

    /* Check addresses to ensure they are configured correctly */
    ASSERT(__noinit_end <= __stack_top, "RAM overflow")
    ASSERT(__vector_table == ORIGIN(FLASH), "Vector table must start at beginning of FLASH")
}
