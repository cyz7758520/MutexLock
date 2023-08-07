


.text


.global MutexLocked
MutexLocked:

    mov         r2, 1                       //设置r2为1。

    ldrexb      r1, [r0]                    //把互斥锁的值读取到r1。
    teq         r1, 0                       //判断r1是否等于0。
    bne         Yield                       //如果r1不等于0，就跳转到Yield。
    strexb      r1, r2, [r0]                //设置互斥锁为r2的1，并存放是否成功到r1。
    teq         r1, 0                       //判断r1是否等于0。
    beq         MutexLockedOut              //如果r1等于0，就表示成功，跳转到MutexLockedOut。

    Yield:
    mov         r3, r0                      //把互斥锁的地址r0复制到r3。
    mov         r12, r7                     //把r7备份到r12。
    mov         r7, 0x9E                    //设置r7为0x9E。

    ReTry:
    svc         0                           //调用sched_yield函数，该函数会设置r0为0。

    ldrexb      r1, [r3]                    //把互斥锁的值读取到r1。
    teq         r1, 0                       //判断r1是否等于0。
    bne         ReTry                       //如果r1不等于0，就跳转到ReTry。
    strexb      r1, r2, [r3]                //设置互斥锁为r2的1，并存放是否成功到r1。
    teq         r1, 0                       //判断r1是否等于0。
    bne         ReTry                       //如果r1不等于0，就表示失败，跳转到ReTry。

    mov         r7, r12                     //恢复r7为r12。

    MutexLockedOut:
    bx lr


.global MutexUnlock
MutexUnlock:
    
    mov         r1, 0                       //设置r1为0。
    dmb         ish                         //设置内存屏障。
    strb        r1, [r0]                    //设置r0为r1的0。
    dmb         ish                         //设置内存屏障。

    bx lr
