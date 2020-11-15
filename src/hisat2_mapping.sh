#!/bin/bash

INDEX=`echo $1 | sed -e "s|.8.ht2||g"`

echo $3/output.sam
ls $3/output.sam

hisat2 \
-x $INDEX \
-U $2 \
-p 4 \
-S $3