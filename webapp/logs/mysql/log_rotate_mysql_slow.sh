#!/bin/sh

SLOW_LOG_PATH="./mysql-slow.log"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
NEW_LOG="$SLOW_LOG_PATH.$TIMESTAMP"

# ここだけ変えてね
CONTAINER_ID="69be0584f4a8"


# 実行時点の日時の YYYYMMDD-HHMMSS 形式で付与したファイル名にローテートする
mv $SLOW_LOG_PATH $NEW_LOG

## 新しいログファイルを作る。フラッシュ時には自動で作ってくれないので
touch $SLOW_LOG_PATH
chmod 660 $SLOW_LOG_PATH

docker exec -i $CONTAINER_ID mysqladmin -uroot -proot flush-logs