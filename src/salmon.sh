#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/koki/Software/Sailfish-0.6.3-Linux_x86-64/lib/
export PATH=$PATH:/home/koki/Software/salmon/sailfish-0.2.2/build/src/

Data1="/home/koki/Quantify_SingleCell/Data/Quartz"
Data2="/home/koki/Data/mm10/refMrna_index"
Out1="/home/koki/Quantify_SingleCell/Data/FPKM/Salmon"
Out2="/home/koki/Quantify_SingleCell/Data/Time"

/usr/bin/time salmon quant -i $Data2 -p 4 -l IU -1 $Data1/XXXXX/XXXXX_1.trim.fastq -2 $Data1/XXXXX/XXXXX_2.trim.fastq -o $Out1/XXXXX/) >& log/Salmon_XXXXX.log