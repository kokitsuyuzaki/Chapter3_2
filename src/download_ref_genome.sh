#!/bin/bash

# GRCh38.p13
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_35/GRCh38.p13.genome.fa.gz -P data && gunzip -cd data/GRCh38.p13.genome.fa.gz > data/GRCh38.p13.genome.fa
