ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K
    SRAM  (rwx) : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
    /* ---------- FLASH ---------- */

    .text :
    {
        *(.isr_vector)
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
    } > FLASH

    .ARM.exidx :
    {
        *(.ARM.exidx*)
        . = ALIGN(4);
    } > FLASH

    /* End of all FLASH content */
    end_of_text = .;

    /* ---------- SRAM ---------- */

    .data : AT(end_of_text)
    {
        start_of_data = .;
        *(.data)
        *(.data.*)
        . = ALIGN(4);
        end_of_data = .;
    } > SRAM

    .bss :
    {
        start_of_bss = .;
        __bss_start__ = start_of_bss;

        *(.bss)
        *(.bss.*)
        *(COMMON)

        . = ALIGN(4);
        end_of_bss = .;
        __bss_end__ = end_of_bss;

        end = .;  
		__end__ = . ;    
    } > SRAM
}

