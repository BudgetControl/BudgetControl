#!/bin/bash

# Set the default environment
env="develop"

# Init all submodules
git submodule update --init --recursive

echo "Stop container"

docker container stop budgetcontrol-core
docker container stop budgetcontrol-gateway
docker container stop budgetcontrol-ms-stats
docker container stop budgetcontrol-ms-authentication
docker container stop budgetcontrol-ms-jobs
docker container stop budgetcontrol-ms-workspace
docker container stop budgetcontrol-ms-budget
docker container stop budgetcontrol-ms-entries
docker container stop budgetcontrol-ms-wallets
docker container stop budgetcontrol-ms-searchengine
docker container stop budgetcontrol-ms-labels
docker container stop budgetcontrol-ms-debt
docker container stop budgetcontrol-ms-savings
docker container stop budgetcontrol-ms-goals
docker container stop budgetcontrol-ms-notifications

echo "Remove container"

docker container rm budgetcontrol-core
docker container rm budgetcontrol-core 
docker container rm budgetcontrol-core php artisan optimize

docker container rm budgetcontrol-gateway
docker container rm budgetcontrol-gateway php artisan optimize

docker container rm budgetcontrol-ms-stats
docker container rm budgetcontrol-ms-authentication
docker container rm budgetcontrol-ms-jobs
docker container rm budgetcontrol-ms-workspace
docker container rm budgetcontrol-ms-budget
docker container rm budgetcontrol-ms-entries
docker container rm budgetcontrol-ms-wallets
docker container rm budgetcontrol-ms-searchengine
docker container rm budgetcontrol-ms-labels
docker container rm budgetcontrol-ms-debt
docker container rm budgetcontrol-ms-savings
docker container rm budgetcontrol-ms-goals
docker container rm budgetcontrol-ms-notifications