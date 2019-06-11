#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/star/SRR36709${srr}
	/usr/bin/time -v \
	tools/STAR-2.7.1a/bin/Linux_x86_64/STAR \
	--runThreadN 4 \
	--genomeDir data/genome_index_star \
	--readFilesIn data/SRR36709${srr}.fastq \
	--outFileNamePrefix analysis/star/SRR36709${srr}/ >& log/star_mapping_SRR36709${srr}.log
done
