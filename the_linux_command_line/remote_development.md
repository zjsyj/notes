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