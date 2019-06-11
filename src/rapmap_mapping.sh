#!/bin/bash

srrs=({77..92})

for srr in ${srrs[@]}; do
	mkdir -p analysis/rapmap/SRR36709${srr}
	/usr/bin/time -v \
	tools/RapMap-latest_linux_x86_64/bin/rapmap \
	quasimap \
	-i data/transcripts_index_rapmap \
	-r data/SRR36709${srr}.fastq.gz \
	-s -t 4 -x \
	-o analysis/rapmap/SRR36709${srr}/mapped_reads.bam >& log/rapmap_mapping_SRR36709${srr}.log
done
