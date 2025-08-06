#!/bin/bash

# Set the default environment
env="develop"

# Init all submodules
git submodule update --init --recursive

echo "Stop container"

docker container stopb udgetcontrol-core
docker container stopb udgetcontrol-core php artisan migrate
docker container stopb udgetcontrol-core php artisan optimize

docker container stopb udgetcontrol-gateway
docker container stopb udgetcontrol-gateway php artisan optimize

docker container stopb udgetcontrol-ms-stats
docker container stopb udgetcontrol-ms-authentication
docker container stopb udgetcontrol-ms-jobs
docker container stopb udgetcontrol-ms-workspace
docker container stopb udgetcontrol-ms-budget
docker container stopb udgetcontrol-ms-entries
docker container stopb udgetcontrol-ms-wallets
docker container stopb udgetcontrol-ms-searchengine
docker container stopb udgetcontrol-ms-labels
docker container stopb udgetcontrol-ms-debt
docker container stopb udgetcontrol-ms-savings
docker container stopb udgetcontrol-ms-goals
docker container stopb udgetcontrol-ms-notifications

echo "Remove container"

docker container rm udgetcontrol-core
docker container rm udgetcontrol-core php artisan migrate
docker container rm udgetcontrol-core php artisan optimize

docker container rm udgetcontrol-gateway
docker container rm udgetcontrol-gateway php artisan optimize

docker container rm udgetcontrol-ms-stats
docker container rm udgetcontrol-ms-authentication
docker container rm udgetcontrol-ms-jobs
docker container rm udgetcontrol-ms-workspace
docker container rm udgetcontrol-ms-budget
docker container rm udgetcontrol-ms-entries
docker container rm udgetcontrol-ms-wallets
docker container rm udgetcontrol-ms-searchengine
docker container rm udgetcontrol-ms-labels
docker container rm udgetcontrol-ms-debt
docker container rm udgetcontrol-ms-savings
docker container rm udgetcontrol-ms-goals
docker container rm udgetcontrol-ms-notifications