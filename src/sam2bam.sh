#!/bin/bash

srrs=({77..92})

samtools=tools/samtools-1.9/samtools

for srr in ${srrs[@]}; do
	echo SRR36709${srr}
	data=analysis/rapmap/SRR36709${srr}
	/usr/bin/time -v \
	$samtools view -Sb -@ 4 - $data/mapped_reads.sam \
	$data/mapped_reads.bam >& log/sam2bam_SRR36709${srr}.log
done
