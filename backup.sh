#! /bin/bash
#zrzut baz danych
for DB in $(mysql -e 'show databases' -s --skip-column-names); do
    mysqldump $DB | gzip -c > ./bak/$DB-backup_$(date +%F-%H_%M).sql.gz;
done

mysqldump --databases p579450_forum p579450_wiki p579450_www -u p579450_dbadmin -p 
## kopia wordpressa
tar -czf ./bak/wordpressbackup_$(date +%F-%H_%M).tar.xz $(echo ./public_html/*.php) $(echo ./public_html/wp-*/)
## kopia forum
tar -czf ./bak/forumbackup__$(date +%F-%H_%M).tar.xz ./public_html/forum/ -R
## kopia wiki
tar -czf ./bak/wikibackup__$(date +%F-%H_%M).tar.xz ./public_html/wiki/ -R
## usuwanie starszych backupów
#find /bak -mtime +7d -delete #--exec rm {}