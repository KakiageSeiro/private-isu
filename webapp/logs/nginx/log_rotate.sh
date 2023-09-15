#!/bin/sh

# 実行時点の日時の YYYYMMDD-HHMMSS 形式で付与したファイル名にローテートする
mv ./access.log ./access.log.`date +%Y%m%d-%H%M%S`

# nginx を再起動
cd ../..
docker-compose restart nginx
