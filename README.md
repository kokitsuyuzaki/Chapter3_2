# Chapter3_2
実験医学別冊 RNA-Seqデータ解析 3章(2) リファレンスゲノムにマッピングしない方法

# 計算環境
このパイプラインは、CentOS Linux release 7.2.1511 (Core)上で実行されました

マシンスペックは、Intel Xeon E5-2697 v2 (2.70 GHz) 、128GB RAM程度です

# 準備
- gitコマンド (>= v1.8.3.1)
- rakeコマンド (>= v11.2.2)
- R (>= v3.5.1)

# 実行

```bash
git clone https://github.com/kokitsuyuzaki/Chapter3_2/
cd Chapter3_2
rake install # データ・ツールのインストール
rake salmon # Salmonの実行
rake kallisto # Kallistoの実行
rake rapmap # RapMapの実行
rake sam2bam # Sam2bamの実行
rake star # STAR実行
rake tximport # tximportの実行
````