#!/bin/bash

for i in $@
do
    mkdir $i
    mv *-$i-* $i
done

