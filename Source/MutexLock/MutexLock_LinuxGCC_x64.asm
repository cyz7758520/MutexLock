.intel_syntax noprefix


.text


.global MutexLocked
MutexLocked:

	mov         al, 1
	xchg        al, byte ptr [rdi]
	test        al, al
	je          MutexLockedOut
	
	ReTry:
	mov			rcx, 100
	LoopPause:
	pause		
	loop		LoopPause

	mov         al, 1
	xchg        al, byte ptr [rdi]
	test        al, al
	jne         ReTry

	MutexLockedOut:
	ret


.global MutexUnlock
MutexUnlock:

	mov			byte ptr [rdi], 0

	ret
