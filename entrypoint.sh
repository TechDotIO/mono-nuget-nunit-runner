#!/bin/bash

cp -a /project/answer/. /project/target

cd /project/target

xbuild /verbosity:quiet /nologo /p:AssemblyName=Solution /p:OutDir=bin/> buildError.txt

if [ -s buildError.txt ]
then
	cat buildError.txt
	exit -1
else

	mono ../packages/NUnit.ConsoleRunner*/tools/nunit3-console.exe --noh --where "$@" ./bin/Solution.dll
fi
