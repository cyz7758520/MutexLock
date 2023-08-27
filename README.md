# 互斥锁
# 必读说明

# 简介
&emsp;&emsp;本软件根据《道德经》为核心思想而设计，实现了多线程同步使用的高性能互斥锁，用汇编语言编写，支持WIndows、Cygwin、Linux、Android NDK平台，比系统自带的互斥锁性能要高很多。  

# 移植
&emsp;&emsp;1、在MutexLock文件夹里有MutexLock.h头文件和对应平台的静态库和动态库文件，根据需要复制到自己的软件中。  
&emsp;&emsp;2、声明互斥锁，例如：MutexLock p_MutexLock = 0;。  
&emsp;&emsp;3、调用MutexLocked函数给互斥锁上锁，例如：MutexLocked( &p_MutexLock );。  
&emsp;&emsp;4、调用MutexUnlock函数给互斥锁解锁，例如：MutexUnlock( &p_MutexLock );。  

# 其他
&emsp;&emsp;本人QQ号：280604597    赤勇玄心行天道  
&emsp;&emsp;本人微信：qq280604597    赤勇玄心行天道  
&emsp;&emsp;本人博客：http://www.cnblogs.com/gaoyaguo  
&emsp;&emsp;源代码：https://github.com/cyz7758520/MutexLock  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;https://gitee.com/chen_yi_ze/MutexLock  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;https://gitcode.net/cyz7758520/MutexLock  

# 捐助
&emsp;&emsp;写软件实属不易，我希望大家能支持我、捐助我，金额随意，1块也是支持，我会继续帮助大家解决问题！  
&emsp;&emsp;![Image text](https://img2022.cnblogs.com/blog/249784/202204/249784-20220409102957978-1181496200.jpg)![Image text](https://img2022.cnblogs.com/blog/249784/202204/249784-20220409102958309-1148822717.png)![Image text](https://img2022.cnblogs.com/blog/249784/202204/249784-20220409102958603-1915091349.png)