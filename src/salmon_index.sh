#!/bin/bash

/usr/bin/time -v \
tools/salmon-latest_linux_x86_64/bin/salmon \
index \
-t data/gencode.v30.transcripts.fa.gz \
-i data/transcripts_index_salmon \
-k 31  >& log/salmon_index.log