################################################################
# パッケージダウンロード
################################################################
install.packages("BiocManager", repos="http://cran.r-project.org")
BiocManager::install("tximport", suppressUpdates=TRUE)
BiocManager::install("Homo.sapiens", suppressUpdates=TRUE)

################################################################
# パッケージロード
################################################################
library("tximport")

################################################################
# Salmon/Kallisto解析結果ファイル
################################################################
srr <- paste0("SRR", 3670977:3670992)
file_salmon <- file.path("analysis/salmon", srr, "quant.sf")
file_salmon_options <- file.path("analysis/salmon_options", srr, "quant.sf")
file_kallisto <- file.path("analysis/kallisto", srr, "abundance.h5")
file_kallisto_options <- file.path("analysis/kallisto_options", srr, "abundance.h5")
names(file_salmon) <- srr
names(file_salmon_options) <- srr
names(file_kallisto) <- srr
names(file_kallisto_options) <- srr

################################################################
# tximport (Transcript-level)
# Countテーブル → edgeR/DESeq/Limma（DTE)
# TPMテーブル → DRIMSeq/DEXSeq (DTU/DEU）
################################################################
txi.salmon <- tximport(
	file_salmon, type="salmon", txOut=TRUE)
# txi.salmon_options <- tximport(
# 	file_salmon_options, type="salmon", txOut=TRUE)
txi.kallisto <- tximport(
	file_kallisto, type="kallisto", txOut=TRUE)
txi.kallisto_options <- tximport(
	file_kallisto_options, type="kallisto", txOut=TRUE)

# Ensembl Gene ID ⇆ Transcript ID (GENCODEがまとめた対応)
geneinfo_salmon <- rownames(txi.salmon$abundance)
geneinfo_kallisto <- rownames(txi.kallisto$abundance)
tx2gene_salmon <- data.frame(
	TXNAME = unlist(lapply(geneinfo_salmon,
		function(x){
			strsplit(x, "\\|")[[1]][1]
		})),
	GENEID = unlist(lapply(geneinfo_salmon,
		function(x){
			strsplit(x, "\\|")[[1]][2]
		}))
)
tx2gene_kallisto <- data.frame(
	TXNAME = unlist(lapply(geneinfo_kallisto,
		function(x){
			strsplit(x, "\\|")[[1]][1]
		})),
	GENEID = unlist(lapply(geneinfo_kallisto,
		function(x){
			strsplit(x, "\\|")[[1]][2]
		}))
)

# 行名変更
rownames(txi.salmon$abundance) <- tx2gene_salmon$TXNAME
rownames(txi.salmon$counts) <- tx2gene_salmon$TXNAME
rownames(txi.salmon$length) <- tx2gene_salmon$TXNAME
# rownames(txi.salmon_options$abundance) <- tx2gene_salmon$TXNAME
# rownames(txi.salmon_options$counts) <- tx2gene_salmon$TXNAME
# rownames(txi.salmon_options$length) <- tx2gene_salmon$TXNAME
rownames(txi.kallisto$abundance) <- tx2gene_kallisto$TXNAME
rownames(txi.kallisto$counts) <- tx2gene_kallisto$TXNAME
rownames(txi.kallisto$length) <- tx2gene_kallisto$TXNAME
rownames(txi.kallisto_options$abundance) <- tx2gene_kallisto$TXNAME
rownames(txi.kallisto_options$counts) <- tx2gene_kallisto$TXNAME
rownames(txi.kallisto_options$length) <- tx2gene_kallisto$TXNAME


# Countテーブル
head(txi.salmon$counts)
# head(txi.salmon_options$counts)
head(txi.kallisto$counts)
head(txi.kallisto_options$counts)

# TPMテーブル
head(txi.salmon$abundance)
# head(txi.salmon_options$abundance)
head(txi.kallisto$abundance)
head(txi.kallisto_options$abundance)

################################################################
# tximport (Gene-level、一度遺伝子レベルに要約)
# Countテーブル → edgeR/DESeq/Limma（DGE）
################################################################

# scaledTPM法による要約
gi.salmon <- summarizeToGene(txi.salmon, tx2gene_salmon,
	countsFromAbundance="scaledTPM")
# gi.salmon_options <- summarizeToGene(txi.salmon_options, tx2gene_salmon,
	# countsFromAbundance="scaledTPM")
gi.kallisto <- summarizeToGene(txi.kallisto, tx2gene_kallisto,
	countsFromAbundance="scaledTPM")
gi.kallisto_options <- summarizeToGene(txi.kallisto_options, tx2gene_kallisto,
	countsFromAbundance="scaledTPM")

# lengthScaledTPM法による要約
gi.salmon <- summarizeToGene(txi.salmon, tx2gene_salmon,
	countsFromAbundance="lengthScaledTPM")
# gi.salmon_options <- summarizeToGene(txi.salmon_options, tx2gene_salmon,
	# countsFromAbundance="lengthScaledTPM")
gi.kallisto <- summarizeToGene(txi.kallisto, tx2gene_kallisto,
	countsFromAbundance="lengthScaledTPM")
gi.kallisto_options <- summarizeToGene(txi.kallisto_options, tx2gene_kallisto,
	countsFromAbundance="lengthScaledTPM")

# 保存
save.image(paste0("analysis/tximport/", Sys.Date(), ".RData"))
