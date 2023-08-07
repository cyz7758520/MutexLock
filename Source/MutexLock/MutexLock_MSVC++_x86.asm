.model flat, c
option casemap :none

.code


public MutexLocked
MutexLocked:

	mov         edx, dword ptr [esp + 4]	;设置edx为互斥锁的地址。

	mov         al, 1						;设置al为1。
	xchg        al, byte ptr [edx]			;原子交换al和互斥锁的值。
	test        al, al						;判断al是否为0。
	je          MutexLockedOut				;如果al为0，就表示成功，跳转到MutexLockedOut。

	ReTry:
	mov			ecx, 100					;设置循环100次。
	LoopPause:
	pause									;线程休眠。
	loop		LoopPause					;循环跳转到LoopPause。

	mov         al, 1						;设置al为1。
	xchg        al, byte ptr [edx]			;原子交换al和互斥锁的值。
	test        al, al						;判断al是否为0。
	jne         ReTry						;如果al不为0，就表示失败，跳转到ReTry。

	MutexLockedOut:
	ret


public MutexUnlock
MutexUnlock:

	mov			edx, dword ptr [esp + 4]	;eax存放互斥锁的地址。
	mov			byte ptr [edx], 0			;设置互斥锁的值为0。

	ret


end
