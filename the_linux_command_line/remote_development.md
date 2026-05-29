### upload or download files/directories to/from remote server
```bash
# This puts files INTO /home/user/project/
rsync -avz ./project/ user@server:/home/user/project/

# This creates /home/user/backup/project/
rsync -avz ./project user@server:/home/user/backup/

# Show progress for large transfers
rsync -avz --progress ./project/ user@server:/home/user/project/

# Dry run (preview what will happen, no actual transfer)
rsync -avz --dry-run ./project/ user@server:/home/user/project/

# Use a specific SSH port
rsync -avz -e "ssh -p 2222" ./project/ user@server:/home/user/project/

# Exclude files/folders
rsync -avz --exclude '.git' --exclude '__pycache__' ./project/ user@server:/home/user/project/

# Delete remote files that no longer exist locally (mirror)
rsync -avz --delete ./project/ user@server:/home/user/project/
```

### SSH
```bash
ssh -L [local_port]:[remote_host]:[remote_port] -l [username] -fN [ssh_server]
```

```bash
# start jupyter notebook on a compute node
$ salloc -t 02:00:00 --nodes=1 --gres=gpu:1 --ntasks-per-node=1 --cpus-per-task=3 --partition=ampere -A YOURACCOUNT jupyter notebook --no-browser --ip=* --port=8081
```

### download FASTQ with ascp
```bash
# GEO database -> GEO Acession viewer -> BioProject -> ENA, filereport_read_run_PRJNA....tsv
head -n 1 file.tsv | tr '\t' '\n' | cat -n | grep 'fastq_aspera'

cut -f the_number_last_output file.tsv | sed '1d' >fq.url

head fq.url

key=""

cat fq.url | while read id; do
    echo "ascp -v -QT -l 300m -P33001 -k1 -i ${key} era-fasp@id ./ "
done >download.sh

nohup sh download.sh 1>download.log 2>&1 &

jobs

less download.sh
```