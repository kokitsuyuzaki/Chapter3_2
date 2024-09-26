#!/bin/bash

# GRCh38.p14
wget ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/gencode.v46.transcripts.fa.gz -P data && gunzip -cd data/gencode.v46.transcripts.fa.gz > data/gencode.v46.transcripts.fa


