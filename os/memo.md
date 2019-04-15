# オペレーティングシステム

2019春 学期前半 月曜3,4

**xv6読むぞ！！！！**

## OSのinterface
- ハードを意識させない抽象化
- シンプルで汎用性があるのがベスト
- UNIXではデバイスもファイル

- ユーザプロセス(ユーザ空間)は必要に応じてカーネルの機能を呼び出す=システムコール
- ライブラリコールとシステムコール

## プロセス
- メモリ空間(code,data,stack)を持つ
- fork()で子プロセスを生成
- exec()で別プロセスを実行

## システムコール
- read/write
	file descriptor(0:stdin, 1:stdout, 2:stderr)
	byte stream

## ファイルシステム
root dirを頂点とした木構造

### ファイル

- regular file
- directory
- device

## xv6
- https://github.com/mit-pdos/xv6-public

### memo
- 16bitから自前で起動する場合
bootasm.S->bootmain()->entry.S->main()

- multiboot対応のブートローダを使う場合
entry.S -> main()

### ファイル構成

#### boot loader(no multiboot bootloader)

- bootasm.S
	boot loader(first step)
	set A20
	initialize GDT
	protect enable
	16bit->32bit
	call bootmain

- bootmain.c
	boot loader(second step)
	load kernel(read disk)
	ELF magic check
	call ELF entry

bootasm.o,bootmain.o -> bootblock.o -> bootblock(binary)
                            |-> bootblock.asm

#### kernel

- entry.S
	multiboot header
	initialize paging/stack
	call main

- main.c
	main()

- defs.h
	構造体，関数の前方宣言

- kernel.ld
	linker script

- bio.c
- console.c
- exec.c
- file.c
- fs.c
- ide.c
- ioapic.c
- kalloc.c
- kbd.c
- lapic.c
- log.c
- mp.c
- picirq.c
- pipe.c
- proc.c
- swtch.S
- spinlock.c
- sleeplock.c
- string.c
- syscall.c
- timer.c
- trap.c
- uart.c
- vm.c

#### user program

- init.c
- sh.c

- cat.c
- echo.c
- forktest.c
- grep.c
- kill.c
- ln.c
- ls.c
- mkdir.c
- rm.c
- streetfs.c
- usertests.c
- wc.c
- zombie.c
- console.c
