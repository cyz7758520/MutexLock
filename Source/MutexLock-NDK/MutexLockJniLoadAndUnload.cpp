#include "jni.h"

JavaVM * g_MutexLockJVM = NULL;

//JNI载入函数。
JNIEXPORT jint JNI_OnLoad( JavaVM * vm, void * reserved )
{
	int p_Rslt = -1; //存放本函数的执行结果，为大于0表示成功，为小于0表示失败。
	
	g_MutexLockJVM = vm;
	
	p_Rslt = JNI_VERSION_1_6;
	
	//Out:
	if( p_Rslt < 0 ) //如果本函数执行失败。
	{
		
	}
	return p_Rslt;
}

//JNI卸载函数。
JNIEXPORT void JNI_OnUnload( JavaVM * vm, void * reserved )
{
	
}
