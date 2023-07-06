/*
 * MIT License
 *
 * Copyright(c) 2011-2020 The Maintainers of Nanvix
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

OUTPUT_FORMAT("elf32-littleriscv")
OUTPUT_ARCH("riscv")

ENTRY(_do_start)

/*
 * RAM Configuration
 */
RAM_BASE = 0x80000000; /* Base Address: 2 GB */
RAM_SIZE = 0x8000000;  /* Size: 128 MB       */

/*
 * Page Size (4 KB)
 */
PAGE_SIZE = 0x1000;

/*
 * Boot Address
 */
BOOT_ADDR = RAM_BASE;

MEMORY
{
	ram(wxa!ri) : ORIGIN = BOOT_ADDR, LENGTH = RAM_SIZE
}

SECTIONS
{
	. = BOOT_ADDR;

	KERNEL_CODE_START = .;

	/* Bootstrap. */
	.bootstrap :
	{
		__BOOTSTRAP_START = .;
		*boot*.o (.*)
		__BOOTSTRAP_END = .;
	} > ram

	. = ALIGN(PAGE_SIZE);

	/* Text. */
	.hal : AT(ADDR(.hal))
	{
		__TEXT_START = .;
		__HAL_TEXT_START = .;
		*(.hal.text)
		*(.hal.text.*)
		__HAL_TEXT_END = .;
	} > ram

	.microkernel : AT(ADDR(.microkernel))
	{
		__MICROKERNEL_TEXT_START = .;
		*(.microkernel.text)
		*(.microkernel.text.*)
		__MICROKERNEL_TEXT_END = .;
	} > ram

	.libnanvix : AT(ADDR(.libnanvix))
	{
		__LIBNANVIX_TEXT_START = .;
		*(.libnanvix.text)
		*(.libnanvix.text.*)
		__LIBNANVIX_TEXT_END = .;
	} > ram

	.ulibc : AT(ADDR(.ulibc))
	{
		__ULIBC_TEXT_START = .;
		*(.ulibc.text)
		*(.ulibc.text.*)
		__ULIBC_TEXT_END = .;
	} > ram

	.multikernel : AT(ADDR(.multikernel))
	{
		__MULTIKERNEL_TEXT_START = .;
		*(.multikernel.text)
		*(.multikernel.text.*)
		__MULTIKERNEL_TEXT_END = .;
	} > ram

	/* Text. */
	.text : AT(ADDR(.text))
	{
		__USER_TEXT_START = .;
		*(.text)
		*(.text.*)
		__USER_TEXT_END = .;
		__TEXT_END = .;
	} > ram

	KERNEL_CODE_END = .;

	. = ALIGN(PAGE_SIZE);

	KERNEL_DATA_START = .;

	/* Initialized data. */
	.data : AT(ADDR(.data))
	{
		__DATA_START = .;
		*(.hal.rodata)
		*(.hal.rodata.*)
		*(.microkernel.rodata)
		*(.microkernel.rodata.*)
		*(.libnanvix.rodata)
		*(.libnanvix.rodata.*)
		*(.ulibc.rodata)
		*(.ulibc.rodata.*)
		*(.multikernel.rodata)
		*(.multikernel.rodata.*)
		*(.rodata)
		*(.rodata.*)
		*(.hal.data)
		*(.hal.data.*)
		*(.microkernel.data)
		*(.microkernel.data.*)
		*(.libnanvix.data)
		*(.libnanvix.data.*)
		*(.ulibc.data)
		*(.ulibc.data.*)
		*(.multikernel.data)
		*(.multikernel.data.*)
		*(.data)
		*(.data.*)
		*(.hal.sdata)
		*(.hal.sdata.*)
		*(.microkernel.sdata)
		*(.microkernel.sdata.*)
		*(.libnanvix.sdata)
		*(.libnanvix.sdata.*)
		*(.ulibc.sdata)
		*(.ulibc.sdata.*)
		*(.multikernel.sdata)
		*(.multikernel.sdata.*)
		*(.sdata)
		*(.sdata.*)
		__DATA_END = .;
	} > ram

	/* Uninitialized data. */
	.bss : AT(ADDR(.bss))
	{
		__BSS_START = .;
		*(.hal.bss)
		*(.hal.bss.*)
		*(.microkernel.bss)
		*(.microkernel.bss.*)
		*(.libnanvix.bss)
		*(.libnanvix.bss.*)
		*(.ulibc.bss)
		*(.ulibc.bss.*)
		*(.multikernel.bss)
		*(.multikernel.bss.*)
		*(.bss)
		*(.bss.*)
		*(.hal.sbss)
		*(.hal.sbss.*)
		*(.microkernel.sbss)
		*(.microkernel.sbss.*)
		*(.libnanvix.sbss)
		*(.libnanvix.sbss.*)
		*(.ulibc.sbss)
		*(.ulibc.sbss.*)
		*(.multikernel.sbss)
		*(.multikernel.sbss.*)
		*(.sbss)
		*(.sbss.*)
		__BSS_END = .;
	} > ram

	KERNEL_DATA_END = .;

	. = ALIGN(PAGE_SIZE);

	/* Discarded. */
	/DISCARD/ :
	{
		*(.comment)
		*(.note)
	}
}
