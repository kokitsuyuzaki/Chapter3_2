#!/bin/bash

/usr/bin/time -v \
tools/hisat2-2.1.0/hisat2-build \
data/GRCh38.p12.genome.fa \
data/genome_index_hisat2 >& log/hisat2_index.log
