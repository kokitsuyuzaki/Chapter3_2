# Chapter3_2
実験医学別冊 RNA-Seqデータ解析 3章(2) リファレンスゲノムにマッピングしない方法

# 計算環境
このパイプラインは、CentOS Linux release 7.2.1511 (Core)上で実行されました

マシンスペックは、Intel Xeon E5-2697 v2 (2.70 GHz) 、128GB RAMです

# 準備
- Snakemake: 
- Docker: 
- Singularity: 

# 実行

```bash
snakemake -j 4 --use-singularity
````