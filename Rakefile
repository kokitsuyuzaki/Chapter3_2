desc "準備"
task :install do
	# リファレンストランスクリプトームをダウンロード
	# GENCODE Human Release 30 (GRCh38.p12)
	sh "wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_30/gencode.v30.transcripts.fa.gz -P data && gunzip -cd data/gencode.v30.transcripts.fa.gz > data/gencode.v30.transcripts.fa"
	# リファレンスゲノムをダウンロード
	# GENCODE Human Release 30 (GRCh38.p12)
	sh "wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_30/GRCh38.p12.genome.fa.gz -P data && gunzip -cd data/GRCh38.p12.genome.fa.gz > data/GRCh38.p12.genome.fa"
	# テストデータダウンロード、解凍（SRP076615）
	sh "src/download_data.sh"
	sh "src/unzip_data.sh"
	# Salmonのダウンロード、インストール（v0.14.0）
	sh "wget https://github.com/COMBINE-lab/salmon/releases/download/v0.14.0/salmon-0.14.0_linux_x86_64.tar.gz -P tools && tar -zxvf tools/salmon-0.14.0_linux_x86_64.tar.gz -C tools"
	# Kallistoのダウンロード、インストール（v0.45.1）
	sh "wget https://github.com/pachterlab/kallisto/releases/download/v0.45.1/kallisto_linux-v0.45.1.tar.gz -P tools && tar -zxvf tools/kallisto_linux-v0.45.1.tar.gz -C tools"
	# RapMapのダウンロード、インストール（v0.6.0）
	sh "wget https://github.com/COMBINE-lab/RapMap/releases/download/v0.6.0/RapMap-0.6.0_linux_x86_64.tar.gz -P tools && tar -zxvf tools/RapMap-0.6.0_linux_x86_64.tar.gz -C tools"
	# STARのダウンロード、インストール（v2.7.1a）
	sh "wget https://github.com/alexdobin/STAR/archive/2.7.1a.tar.gz -P tools && tar -zxvf tools/2.7.1a.tar.gz -C tools && cd tools/STAR-2.7.1a/source && make STAR"
	# samtoolsのダウンロード、インストール（v1.9）
	sh "wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 -P tools && tar -jxvf tools/samtools-1.9.tar.bz2 -C tools && cd tools/samtools-1.9 && ./configure --prefix=/usr/local/ && make -j 8"
end

desc "SalmonでTranscript-levelの発現量を定量化"
task :salmon do
	sh "src/salmon_index.sh"
	sh "src/salmon_quant.sh"
	sh "src/salmon_quant_options.sh"
end

desc "KallistoでTranscript-levelの発現量を定量化"
task :kallisto do
	sh "src/kallisto_index.sh"
	sh "src/kallisto_quant.sh"
	sh "src/kallisto_quant_options.sh"
end

desc "STARでトランスクリプトームにマッピング"
task :rapmap do
	sh "src/rapmap_index.sh"
	sh "src/rapmap_mapping.sh"
end

desc "SAM → BAM変換"
task :sam2bam do
	sh "src/sam2bam.sh"
end

desc "STARでゲノムにマッピング"
task :star do
	sh "src/star_index.sh"
	sh "src/star_mapping.sh"
end

desc "tximportでGene-levelの発現量に要約"
task :tximport do
	sh "R CMD BATCH src/tximport.R"
end
