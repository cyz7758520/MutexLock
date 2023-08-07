#!/bin/bash

#打印脚本执行的命令
#set -x

if [ $# != 2 ] ;
then
	echo "脚本参数个数不是2，用法：$0 旧名称 新名称"
	exit
fi

#旧名称
OldName=$1
echo 旧名称 $OldName
#新名称
NewName=$2
echo 新名称 $NewName

#旧名称大写
OldNameUpper=`echo $1 | tr 'a-z' 'A-Z'`
echo 旧名称大写 $OldNameUpper
#新名称大写
NewNameUpper=`echo $2 | tr 'a-z' 'A-Z'`
echo 新名称大写 $NewNameUpper

#设置内部字段分隔符为换行符，这样for in语句就只已换行符作为分隔，这样FileName变量就是一行的文件名。
IFS=$'\n'

#遍历所有文件的相对完整路径，要倒序遍历，这样保证在修改文件夹名称修改之前，子文件名都修改好了。
for FileName in `find | sort -r` ;
do
	#打印当前文件
	echo 正在处理 $FileName
	
	#替换文件内容
	if [ -f $FileName ] ; #如果为文件
	then
		sed -i -e 's/'$OldName'/'$NewName'/g' -e 's/'$OldNameUpper'/'$NewNameUpper'/g' $FileName
	fi
	
	#替换文件名称
	NewFileName=`echo $FileName | sed 's/\(.*\)'$1'\([^/]*\)$/\1'$2'\2/'`
	if [ "$FileName" != "$NewFileName" ] ;
	then
		mv $FileName $NewFileName
	fi
done

#end