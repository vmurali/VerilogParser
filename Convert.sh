#!/bin/bash

for file in mk*.v
do
  Multicycle -o multi ${file}
done
