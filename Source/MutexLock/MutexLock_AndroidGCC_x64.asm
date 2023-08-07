


section .code


global MutexLocked
MutexLocked:

    mov         al, 1						;设置al为1。
	xchg        al, byte [rcx]				;原子交换al和互斥锁的值。
	test        al, al						;判断al是否为0。
	je          MutexLockedOut				;如果al为0，就表示成功，跳转到MutexLockedOut。

	mov         rdx, rcx					;把互斥锁的地址rcx复制到rdx。
	
	ReTry:
	mov			rcx, 100					;设置循环100次。
	LoopPause:
	pause		;线程休眠。
	loop		LoopPause					;循环跳转到LoopPause。

	mov         al, 1						;设置al为1。
	xchg        al, byte [rdx]				;原子交换al和互斥锁的值。
	test        al, al						;判断al是否为0。
	jne         ReTry						;如果al不为0，就表示失败，跳转到ReTry。

	MutexLockedOut:
	ret
    

global MutexUnlock
MutexUnlock:

    mov			byte [rcx], 0				;设置互斥锁的值为0。

	ret
