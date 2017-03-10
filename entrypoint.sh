#!/bin/bash

cd /project/target

xbuild /verbosity:quiet /nologo /p:AssemblyName=Solution /p:OutDir=bin/> buildError.txt

if [ -s buildError.txt ]
then
	cat buildError.txt
	exit -1
else
	nunit_console=$(find /project/packages/ -wholename "/project/packages/NUnit.ConsoleRunner*/tools/nunit3-console.exe" -print -quit)
	mono $nunit_console --noh --where "$@" ./bin/Solution.dll
fi
