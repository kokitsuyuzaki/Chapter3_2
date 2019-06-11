#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/salmon/SRR36709${srr}
	/usr/bin/time -v \
	tools/salmon-latest_linux_x86_64/bin/salmon \
	quant \
	-i data/transcripts_index_salmon \
	-p 4 \
	-l A \
	-r data/SRR36709${srr}.fastq.gz \
	-o analysis/salmon/SRR36709${srr} >& log/salmon_quant_SRR36709${srr}.log
done
