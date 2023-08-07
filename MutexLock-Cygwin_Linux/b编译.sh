#!/bin/bash

if [[ $OSTYPE == *cygwin* ]]
then
	make CygwinGCC_x64
else
	make LinuxGCC_x64
fi