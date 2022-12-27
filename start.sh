#!/usr/bin/env bash

# Rebuild splitted file
cat data/u2net.onnx_segment-* > data/u2net.onnx
rm data/u2net.onnx_segment-*

chmod +x ./stop.sh
docker network create --subnet=10.5.0.0/16 nginx_subnet
docker compose --verbose up -d
