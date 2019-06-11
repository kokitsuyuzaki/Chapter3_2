#!/bin/bash

/usr/bin/time -v \
tools/kallisto_linux-v0.45.1/kallisto \
index \
-i data/transcripts_index_kallisto \
data/gencode.v30.transcripts.fa.gz \
-k 31  >& log/kallisto_index.log
