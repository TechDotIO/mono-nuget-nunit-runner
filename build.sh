#!/bin/bash

cd /project/target

nuget update -self
nuget config -set repositoryPath=/project/packages


if [ -f packages.config ]; then
    nuget install packages.config
fi

nuget install NUnit.ConsoleRunner
