#!/bin/bash

mkdir -p data/genome_index_star

/usr/bin/time -v \
tools/STAR-2.7.1a/bin/Linux_x86_64/STAR \
--runMode genomeGenerate \
--genomeDir data/genome_index_star \
--genomeFastaFiles data/GRCh38.p12.genome.fa \
--runThreadN 4 >& log/star_index.log
