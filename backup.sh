#! /bin/bash
#zrzut baz danych
mysqldump --all-databases | xz > databasebackup_$(date +%F-%H_%M).xz
## kopia wordpressa
#tar -czf ./bak/wordpressbackup_$(date +%F-%H_%M).tar.xz $(echo *.php) $(echo wp-*/)
## kopia forum
tar -czf ./bak/forumbackup__$(date +%F-%H_%M).tar.xz forum
## kopia wiki
tar -czf ./bak/wikibackup__$(date +%F-%H_%M).tar.xz wiki
## usuwanie starszych backupów
#find /bak -mtime +7d -delete #--exec rm {}