#!/bin/bash

for file in *.v
do
  ../../../Multicycle -o multi ${file}
done
