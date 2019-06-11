#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/salmon_options/SRR36709${srr}
	/usr/bin/time -v \
	tools/salmon-latest_linux_x86_64/bin/salmon \
	quant \
	-i data/transcripts_index_salmon \
	-p 4 \
	-l A \
	--numBootstraps 100 \
	--seqBias \
	--gcBias \
	--posBias \
	-r data/SRR36709${srr}.fastq.gz \
	-o analysis/salmon_options/SRR36709${srr} >& log/salmon_options_quant_SRR36709${srr}.log
done
