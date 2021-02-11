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
/*
OUTPUT_FORMAT("elfxx-aarch64")
*/

ENTRY(_do_start)

PAGE_SIZE = 0x1000;

RAM_BASE = 0x40080000;
RAM_SIZE = 0x80000000;

BOOT_ADDR = RAM_BASE;

SECTIONS
{
	. = BOOT_ADDR;
	KERNEL_CODE_START = .;

	.bootstrap :
	{
		__BOOTSTRAP_START = .;
		*boot*.o (.*)
		__BOOTSTRAP_END = .;
	}

	. =ALIGN(PAGE_SIZE);

	.text : AT(ADDR(.text))
	{
		__TEXT_START = .;
		*(.text.*)
		__TEXT_END = .;
	}

	KERNEL_CODE_END = .;

	. = ALIGN(PAGE_SIZE);

	KERNEL_DATA_START = .;

	.data : AT(ADDR(.data))
	{
		__DATA_START = .;
		*(.rodata)
		*(.rodata.*)
		*(.data)
		*(.data.*)
		__DATA_END = .;
	}

	.bss : AT(ADDR(.bss))
	{
		__BSS_START = .;
		*(.bss)
		*(.bss.*)
		__BSS_END = .;
	}

	KERNEL_DATA_END = .;

	. =ALIGN(PAGE_SIZE);

	/DISCARD/ :
	{
		*(.comment)
		*(.note)
	}

	__BSS_SIZE = __BSS_END - __BSS_START;

	stack_top = . + 0x4000;
}
