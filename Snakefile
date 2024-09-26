SAMPLEs = ['SRR36709' + str(item+77) for item in list(range(16))]

rule all:
	input:
		expand("output/star/{sample}/Aligned.out.sam",
			sample=SAMPLEs),
		expand("output/hisat2/{sample}/output.sam",
			sample=SAMPLEs),
		"output/tximport/tximport.RData"

rule download_ref_transcriptome:
	output:
		"data/gencode.v46.transcripts.fa.gz",
		"data/gencode.v46.transcripts.fa"
	resources:
		mem_mb=1000000
	benchmark:
		"benchmarks/download_ref_transcriptome.txt"
	log:
		"logs/download_ref_transcriptome.log"
	shell:
		"src/download_ref_transcriptome.sh"

rule download_ref_genome_human:
	output:
		"data/GRCh38.p14.genome.fa.gz",
		"data/GRCh38.p14.genome.fa"
	resources:
		mem_mb=1000000
	benchmark:
		"benchmarks/download_ref_genome.txt"
	log:
		"logs/download_ref_genome.log"
	shell:
		"src/download_ref_genome.sh"

rule download_fastq:
	output:
		"data/{sample}.fastq.gz"
	resources:
		mem_mb=1000000
	benchmark:
		"benchmarks/download_fastq_{sample}.txt"
	log:
		"logs/download_fastq_{sample}.log"
	shell:
		"src/download_fastq.sh {wildcards.sample}"

rule unzip_fastq:
	input:
		"data/{sample}.fastq.gz"
	output:
		"data/{sample}.fastq"
	resources:
		mem_mb=1000000
	benchmark:
		"benchmarks/unzip_fastq_{sample}.txt"
	log:
		"logs/unzip_fastq_{sample}.log"
	shell:
		"src/unzip_fastq.sh {wildcards.sample}"

rule salmon_index:
	input:
		"data/gencode.v46.transcripts.fa.gz"
	output:
		"data/transcripts_index_salmon/info.json"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/salmon:1.10.3--hb7e2ac5_1"
	benchmark:
		"benchmarks/salmon_index.txt"
	log:
		"logs/salmon_index.log"
	shell:
		"src/salmon_index.sh {input}"

rule salmon_quant:
	input:
		"data/transcripts_index_salmon/info.json",
		"data/{sample}.fastq.gz"
	output:
		"output/salmon/{sample}/quant.sf"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/salmon:1.10.3--hb7e2ac5_1"
	benchmark:
		"benchmarks/salmon_quant_{sample}.txt"
	log:
		"logs/salmon_quant_{sample}.log"
	shell:
		"src/salmon_quant.sh {input} {output}"

rule salmon_quant_options:
	input:
		"data/transcripts_index_salmon/info.json",
		"data/{sample}.fastq.gz"
	output:
		"output/salmon_options/{sample}/quant.sf"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/salmon:1.10.3--hb7e2ac5_1"
	benchmark:
		"benchmarks/salmon_quant_options_{sample}.txt"
	log:
		"logs/salmon_quant_options_{sample}.log"
	shell:
		"src/salmon_quant_options.sh {input} {output}"

rule kallisto_index:
	input:
		"data/gencode.v46.transcripts.fa.gz"
	output:
		"data/transcripts_index_kallisto"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/kallisto:0.46.2--h4f7b962_1"
	benchmark:
		"benchmarks/kallisto_index.txt"
	log:
		"logs/kallisto_index.log"
	shell:
		"src/kallisto_index.sh {input}"

rule kallisto_quant:
	input:
		"data/transcripts_index_kallisto",
		"data/{sample}.fastq.gz"
	output:
		"output/kallisto/{sample}/abundance.h5"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/kallisto:0.46.2--h4f7b962_1"
	benchmark:
		"benchmarks/kallisto_quant_{sample}.txt"
	log:
		"logs/kallisto_quant_{sample}.log"
	shell:
		"src/kallisto_quant.sh {input} {output}"

rule kallisto_quant_options:
	input:
		"data/transcripts_index_kallisto",
		"data/{sample}.fastq.gz"
	output:
		"output/kallisto_options/{sample}/abundance.h5"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/kallisto:0.46.2--h4f7b962_1"
	benchmark:
		"benchmarks/kallisto_quant_options_{sample}.txt"
	log:
		"logs/kallisto_quant_options_{sample}.log"
	shell:
		"src/kallisto_quant_options.sh {input} {output}"

rule star_index:
	input:
		"data/GRCh38.p14.genome.fa"
	output:
		"data/genome_index_star/Log.out"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/star:2.7.11b--h43eeafb_2"
	benchmark:
		"benchmarks/star_index.txt"
	log:
		"logs/star_index.log"
	shell:
		"src/star_index.sh {input}"

rule star_mapping:
	input:
		"data/genome_index_star/Log.out",
		"data/{sample}.fastq"
	output:
		"output/star/{sample}/Aligned.out.sam"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/star:2.7.11b--h43eeafb_2"
	benchmark:
		"benchmarks/star_mapping_{sample}.txt"
	log:
		"logs/star_mapping_{sample}.log"
	shell:
		"src/star_mapping.sh {input} {output}"

rule hisat2_index:
	input:
		"data/GRCh38.p14.genome.fa"
	output:
		"data/genome_index_hisat2.8.ht2"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/hisat2:2.2.1--h87f3376_5"
	benchmark:
		"benchmarks/hisat2_index.txt"
	log:
		"logs/hisat2_index.log"
	shell:
		"src/hisat2_index.sh {input}"

rule hisat2_mapping:
	input:
		"data/genome_index_hisat2.8.ht2",
		"data/{sample}.fastq"
	output:
		"output/hisat2/{sample}/output.sam"
	resources:
		mem_mb=1000000
	container:
		"docker://quay.io/biocontainers/hisat2:2.2.1--h87f3376_5"
	benchmark:
		"benchmarks/hisat2_mapping_{sample}.txt"
	log:
		"logs/hisat2_mapping_{sample}.log"
	shell:
		"src/hisat2_mapping.sh {input} {output}"

rule tximport:
	input:
		expand("output/{salmon}/{sample}/quant.sf",
			sample=SAMPLEs,
			salmon=['salmon', 'salmon_options']),
		expand("output/{kallisto}/{sample}/abundance.h5",
			sample=SAMPLEs,
			kallisto=['kallisto', 'kallisto_options'])
	output:
		"output/tximport/tximport.RData"
	resources:
		mem_mb=1000000
	container:
		"docker://koki/chapter3_2:20240925"
	benchmark:
		"benchmarks/tximport.txt"
	log:
		"logs/tximport.log"
	shell:
		"src/tximport.sh"