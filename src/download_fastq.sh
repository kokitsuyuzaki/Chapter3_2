#!/bin/bash

ID1=$1
ID2=`echo $1 | cut -c 1-6`
ID3=00`echo $1 | cut -c 10`

wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/$ID2/$ID3/$ID1/$ID1.fastq.gz -P data
