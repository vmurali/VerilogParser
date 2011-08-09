#!/bin/bash

for file in *.v
do
  if [[ ! ${file} == Base.v && ! ${file} == RegFile.v && ! ${file} == Rand.v ]]
  then
    Multicycle -o ../multi ${file}
  fi
done
