## download neccessary data online

### introduction to most used library
- NCBI-SRA
https://www.ncbi.nlm.nih.gov/sra
- EBI-ENA
https://www.ebi.ac.uk/

*SRA* is short for Sequence Read Archive

SRA data is divided into meta data and experiment data

meta data includes sequence platform, experiment design, sample data, etc

- study
- sample
- experiment
- run
- submission

sratoolkit is used to convert .sra file into fastq or sam file

ENA library provide fastq.gz file


### data search

### data download
```shell
prefetch \
    # --option-fle SRR text file
    --option-fle some/path/SRPxxxx_SRR_Acc_List.txt \
    -O some/path/to_save
```
to check download result
tree some_data_path

prefetch + aspera

prefetch download a 20G max file size by default
this can be changed with extra parameter,--max-size 100G
### SRA file untar
fastq-dump or faster-dump

```fasterq-dump
# sra file name
input_sra="$1"

# output file path
out_file="$2"

if [[ -z "$input_sra" || -z "$out_file" ]];then
    echo "error, please input valid sra_file output file"
    exit 1
fi

faster-dump \
    --split-3 "$input_sra" \
    -e 20 \
    -o "$out_file" \
    -p
```
### handle exception

## high-through data download and untar

## singele cell library structure

## STARsolo upstream analysis

