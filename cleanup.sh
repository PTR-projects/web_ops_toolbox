#! /bin/bash
##usuwanie co tydzień starszych niż tydzień backupów
find /bak -mtime +7d -delete
curl https://nosnch.in/9764978ed7