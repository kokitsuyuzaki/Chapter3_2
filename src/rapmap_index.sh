#!/bin/bash

/usr/bin/time -v \
tools/RapMap-latest_linux_x86_64/bin/rapmap \
quasiindex \
-t data/gencode.v30.transcripts.fa.gz \
-i data/transcripts_index_rapmap >& log/rapmap_index.log