#!/usr/bin/env bash

# Rebuild splitted file
cat data/u2net.onnx_segment-* > data/u2net.onnx
rm data/u2net.onnx_segment-*

# Certificate copy
cp $(readlink -f /etc/letsencrypt/live/ericamartina.live/fullchain.pem) ./nginx/fullchain.pem
cp $(readlink -f /etc/letsencrypt/live/ericamartina.live/privkey.pem) ./nginx/privkey.pem

chmod +x ./stop.sh
docker network create --subnet=10.5.0.0/16 nginx_subnet
docker compose --verbose up -d
