#!/usr/bin/env bash

# Rebuild splitted file
cat data/u2net.onnx.1_segment-* > data/u2net.onnx.1

chmod +x ./stop.sh
docker network create --subnet=10.5.0.0/16 nginx_subnet
docker compose --verbose up -d
