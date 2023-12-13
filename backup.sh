#!/usr/bin/env bash
set -euo pipefail
dbs=("p579450_forum" "p579450_wiki" "p579450_www")
#zrzut baz danych
for DB in "${dbs[@]}" 
do
    mysqldump $DB | gzip -c > ./bak/$DB-backup_$(date +%F-%H_%M).sql.gz;
done


## kopia wordpressa
tar -czf ./bak/wordpressbackup_$(date +%F-%H_%M).tar.gz $(echo ./public_html/*.php) $(echo ./public_html/wp-*/)
## kopia forum
tar -czf ./bak/forumbackup__$(date +%F-%H_%M).tar.gz ./public_html/forum/ -R
## kopia wiki
tar -czf ./bak/wikibackup__$(date +%F-%H_%M).tar.gz ./public_html/wiki/ -R
## usuwanie starszych backupów
#find /bak -mtime +7d -delete #--exec rm {}

curl https://nosnch.in/9764978ed7