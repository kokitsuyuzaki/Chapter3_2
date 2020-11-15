#!/bin/bash

INDEX=`echo $1 | sed -e "s|/info.json||g"`
OUTDIR=`echo $3 | sed -e "s|/quant.sf||g"`

salmon quant \
-i $INDEX \
-p 4 \
-l A \
-r $2 \
-o $OUTDIR