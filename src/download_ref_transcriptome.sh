#!/bin/bash

# GRCh38.p13
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/gencode.v35.transcripts.fa.gz -P data && gunzip -cd data/gencode.v35.transcripts.fa.gz > data/gencode.v35.transcripts.fa
