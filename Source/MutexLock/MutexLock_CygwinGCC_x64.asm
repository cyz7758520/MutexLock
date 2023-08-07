.intel_syntax noprefix


.text


.global MutexLocked
MutexLocked:

	mov         al, 1
	xchg        al, byte ptr [rcx]
	test        al, al
	je          MutexLockedOut

	mov         rdx, rcx
	
	ReTry:
	mov			rcx, 100
	LoopPause:
	pause		
	loop		LoopPause

	mov         al, 1
	xchg        al, byte ptr [rdx]
	test        al, al
	jne         ReTry

	MutexLockedOut:
	ret


.global MutexUnlock
MutexUnlock:

	mov			byte ptr [rcx], 0

	ret
