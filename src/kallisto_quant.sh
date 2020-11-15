#!/bin/bash

OUTDIR=`echo $3 | sed -e "s|/abundance.h5||g"`

kallisto quant \
-i $1 \
-o $OUTDIR \
-t 4 \
--single \
-l 200 \
-s 20 \
$2