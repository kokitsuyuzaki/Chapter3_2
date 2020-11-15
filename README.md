# Chapter3_2
実験医学別冊 RNA-Seqデータ解析 3章(2) リファレンスゲノムにマッピングしない方法

![DAG](https://github.com/kokitsuyuzaki/Chapter3_2/blob/master/dag.png?raw=true "DAG")

# 計算環境
このパイプラインは、CentOS Linux release 7.2.1511 (Core)上で実行されました

マシンスペックは、Intel Xeon E5-2697 v2 (2.70 GHz) 、128GB RAMです

# 準備
- Snakemake: 5.28.0
- Docker: 17.09.0-ce, build afdb6d4
- Singularity: 3.5.3

# 実行

```bash
snakemake -j 4 --use-singularity
````