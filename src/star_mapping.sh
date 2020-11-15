#!/bin/bash

INDEX=`echo $1 | sed -e "s|/Log.out||g"`
OUTDIR=`echo $3 | sed -e "s|Aligned.out.sam||g"`

STAR \
--runThreadN 4 \
--genomeDir $INDEX \
--readFilesIn $2 \
--outFileNamePrefix $OUTDIR