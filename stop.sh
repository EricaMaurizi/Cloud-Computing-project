#!/usr/bin/env bash

docker compose --verbose down
docker network rm nginx_subnet
docker rmi $(docker images | grep 'streamlit' | awk '{printf $3}')
split -b 40M data/u2net.onnx.1 data/u2net.onnx.1_segment-
rm split data/u2net.onnx.1
