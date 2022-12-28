#!/usr/bin/env bash

docker compose --verbose down
docker network rm nginx_subnet
docker image remove $(docker images | grep 'streamlit' | awk '{printf $3}')
split -b 47M data/u2net.onnx data/u2net.onnx_segment-
rm data/u2net.onnx
rm ./nginx/privkey.pem
rm ./nginx/fullchain.pem
