#/bin/sh

ps -C $1 -o rss= | awk '{sum+=$1} END {print sum/1024 " MB"}'

