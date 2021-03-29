#!/bin/bash

for loc in $@
do 
    cp -v $0 "$loc"
done
