#!/bin/bash

# GRCh38.p14
wget ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_46/GRCh38.p14.genome.fa.gz -P data && gunzip -cd data/GRCh38.p14.genome.fa.gz > data/GRCh38.p14.genome.fa
