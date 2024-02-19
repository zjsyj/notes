[source](https://mp.weixin.qq.com/s/GDly5XfJriP57eXJVBTRnA)

## STARSolo 完成上游定量

```shell

cd some_dest_path

mkdir -p reference # 基因组文件 \
         refIndex/GRCh38-2020-A # 基因组索引 \
         script # shell script \
         singlecell_whitelist # whitelist \
         solout # 结果输出 \
         data   # fastq 数据
```

download data
```shell
cd some_dest_path/data
prefetch SRR20736751 --max-size 100G
fastq-dump SRR20736751.srq --gzip --split-files

# OR use Aspera
ascp -QT -l 300m -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR207/051/SRR20736751/SRR20736751_1.fastq.gz . && mv SRR20736751_1.fastq.gz SRR20736751_GSM6424660_PAH_3_scRNAseq_Homo_sapiens_RNA-Seq_1.fastq.gz
ascp -QT -l 300m -P33001 -i $HOME/.aspera/connect/etc/asperaweb_id_dsa.openssh era-fasp@fasp.sra.ebi.ac.uk:vol1/fastq/SRR207/051/SRR20736751/SRR20736751_2.fastq.gz . && mv SRR20736751_2.fastq.gz SRR20736751_GSM6424660_PAH_3_scRNAseq_Homo_sapiens_RNA-Seq_2.fastq.gz
```

### 下载参考序列文件，构建索引文件
第一次运行时候需要构建, 首先你需要下载基因组注释的FASTA和GTF文夹
[source](https://asia.ensembl.org/Homo_sapiens/Info/Index)

```shell
# star_make_index.sh
STAR \
    --runThreadN 20 \
    --runMode genomeGenerate \
    # 索引储存文件夹
    --genomeDir ~/upstream/refIndex/GRCh38-2020-A \
    # fa文件路径
    --genomeFastaFiles ~/upstream/reference/GRCh38.primary_assembly.genome.fa \
    # gtf文件路径
    --sjdbgtffile ~/upstream/reference/gencode.v41.annotation.gtf
```

### whitelist 准备
[source](https://github.com/10XGenomics/cellranger/tree/master/lib/python/cellranger/barcodes)

these whitelist could be:
- 3M-february-2018.txt
- 737K-april-2014_rc.txt
- 737K-august-2016.txt

### run STARSolo
```shell
# starsolo_10x_v2.sh
##==== parameters ====
## Paths, $1 should be absolute path
inPath="$1/data"
outPath="$1/solout"
sampleID="SRR20736751"

## STAR config
refIndex="$1/refIndex/GRCh38-2020-A"
CPU=16

## barcode config
## 前面已经确定了是 10x 3'v2
whiteList="~/upstream/singlecell_whitelist/737K-august-2016.txt ## 10x 3'v2" ## 10x 3'v2
## 10x 3'v2 CB+UMI=16+10
barcode_setting="--soloCBstart 1 --soloCBlen 16 --soloUMIstart 17 --soloUMIlen 10 --soloBarcodeReadLength 0"

## 10x 3'v3
# whiteList=/home/data/gz123/upstream/singlecell_whitelist/3M-february-2018.txt
# barcode_setting="--soloCBstart 1 --soloCBlen 16 --soloUMIstart 17 --soloUMIlen 12 --soloBarcodeReadLength 0"

## input config
inFASTQ_cDNA="$inPath/$sampleID/SRR20736751_2.fastq.gz"     ## 插入片段，cDNA，长度为98
inFASTQ_barcode="$inPath/$sampleID/SRR20736751_1.fastq.gz"  ## CB+UMI，有效长度16+10

## output config
soloFeatures="Gene Velocyto" # 输出velocyto矩阵文件，用于RNA速率分析
outSAMSettings="--outSAMtype None" #不输出BAM文件，节约空间
outPrefix="$outPath/$sampleID"

##==== cmds ====
STAR --genomeDir $refIndex \
--runThreadN $CPU \
$outSAMSettings \
--outFileNamePrefix $outPrefix/ \
--readFilesIn $inFASTQ_cDNA $inFASTQ_barcode \
--readFilesCommand zcat \
--soloType CB_UMI_Simple \
$barcode_setting \
--soloCBwhitelist $whiteList \
--soloCellFilter EmptyDrops_CR \
--soloFeatures $soloFeatures \
# --outTmpDir /home/jarning/solotmp 

## --outTmpDir is for WSL users, see https://github.com/alexdobin/STAR/issues/1776
## The Linux users do not need this option.
```

filtered就是最终的文件
- 如果你只是跑标准流程, 则取Solo.out/Gene/filtered
- 如果你需要跑RNA速率分析, 则取Solo.out/Velocyto/filtered
