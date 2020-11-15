#!/bin/bash

STAR \
--runMode genomeGenerate \
--genomeDir data/genome_index_star \
--genomeFastaFiles $1 \
--runThreadN 4