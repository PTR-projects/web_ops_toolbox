#! /bin/bash
#zrzut baz danych
for DB in $(mysql -e 'show databases' -s --skip-column-names); do
    mysqldump $DB | gzip -c > ./bak/$DB-backup_$(date +%F-%H_%M).sql.gz;
done


## kopia wordpressa
tar -czf ./bak/wordpressbackup_$(date +%F-%H_%M).tar.xz $(echo ./public_html/*.php) $(echo ./public_html/wp-*/)
## kopia forum
tar -czf ./bak/forumbackup__$(date +%F-%H_%M).tar.xz ./public_html/forum/ -R
## kopia wiki
tar -czf ./bak/wikibackup__$(date +%F-%H_%M).tar.xz ./public_html/wiki/ -R
## usuwanie starszych backupów
#find /bak -mtime +7d -delete #--exec rm {}

curl https://nosnch.in/9764978ed7