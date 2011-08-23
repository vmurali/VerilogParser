#!/bin/bash

for file in *.v
do
  if [[ ! ${file} == Base.v && ! ${file} == RegFile.v && ! ${file} == Rand.v ]]
  then
    echo "Applying Multicycle on ${file}"
    Multicycle -o ../multi ${file}
  fi
done
