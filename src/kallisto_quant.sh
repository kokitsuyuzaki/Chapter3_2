#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/kallisto/SRR36709${srr}
	/usr/bin/time -v \
	tools/kallisto_linux-v0.45.1/kallisto \
	quant \
	-i data/transcripts_index_kallisto \
	-o analysis/kallisto/SRR36709${srr} \
	-t 4 \
	--single \
	-l 200 \
	-s 20 \
	data/SRR36709${srr}.fastq.gz >& log/kallisto_quant_SRR36709${srr}.log
done
