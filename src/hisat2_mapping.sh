#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/hisat2/SRR36709${srr}
	/usr/bin/time -v \
	tools/hisat2-2.1.0/hisat2 \
	-x data/genome_index_hisat2 \
	-U data/SRR36709${srr}.fastq \
	-p 4 \
	-S analysis/hisat2/SRR36709${srr}/output.sam >& log/hisat2_mapping_SRR36709${srr}.log
done
