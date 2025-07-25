#!/bin/bash

# Set the default environment
env="develop"

# Init all submodules
git submodule update --init --recursive

# Copy .env.example to .env for each repository
for repo in "${repositories[@]}"; do
  repo_name=$(basename "$repo" .git)
  if [ -d "microservices/$repo_name" ]; then
    if [ -f "microservices/$repo_name/.env" ]; then
      echo ".env file already exist for $repo_name"
    else
      echo "Copying .env.example to .env for $repo_name"
      cp "microservices/$repo_name/.env.example" "microservices/$repo_name/.env"
      # Checkout develop branch if it exists
      cd "microservices/$repo_name" || exit
      git fetch origin
      if git branch -r | grep -q "origin/$env"; then
        echo "Switching to $env branch for $repo_name"
        git checkout "$env"
      fi
    fi
  fi
done

# Destroy all containers
docker compose down

# Function to wait for all containers to be running
docker-compose.yaml() {
  local container_names=(
    "budgetcontrol-core"
    "budgetcontrol-gateway"
    "budgetcontrol-ms-authentication"
    "budgetcontrol-ms-workspace"
    "budgetcontrol-ms-stats"
    "budgetcontrol-ms-budget"
    "budgetcontrol-ms-entries"
    "budgetcontrol-ms-wallets"
    "budgetcontrol-ms-searchengine"
    "budgetcontrol-ms-labels"
    "budgetcontrol-ms-jobs"
    "budgetcontrol-ms-debt"
    "budgetcontrol-ms-savings"
    "budgetcontrol-ms-goals"
    "budgetcontrol-ms-notifications"
  )

  all_running=true
  for container_name in "${container_names[@]}"; do
    status=$(docker inspect -f '{{.State.Status}}' $container_name)
    echo "Container $container_name status: $status"
    if [ "$status" != "running" ]; then
      all_running=false
      break
    fi
  done

  if [ "$all_running" = true ]; then
    echo "All containers are running."
  else
    echo "Not all containers are running."
  fi
}

echo "Generate a dummy SSL certificate"
mkdir -p bin/certbot/conf/live/dummy
openssl req -x509 -nodes -newkey rsa:4096 -keyout bin/certbot/conf/live/dummy/key.pem -out bin/certbot/conf/live/dummy/fullchain.pem -days 365

# Show the selected environment
echo "Installing $env environment"

# Add logic for specific environment
case $env in
  develop)
    echo "Setting up DEV environment"
    docker compose -f docker-compose.yml -f docker-compose.db.yml -f docker-compose.dev.yml up -d    
    ;;
  production)
    echo "Setting up PROD environment"
    docker compose -f docker-compose.yml -f docker-compose.db.yml up -d
    docker container cp bin/apache/default.conf budgetcontrol-core:/etc/apache2/sites-available/budgetcontrol.cloud.conf
    ;;
  *)
    echo "Unknown environment: $env"
    usage
    ;;
esac

echo "Build Gateway"
docker container cp microservices/Gateway/bin/apache/default.conf budgetcontrol-gateway:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build Core"
docker container cp microservices/Core/bin/apache/default.conf budgetcontrol-core:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Authentication"
docker container cp microservices/Authentication/bin/apache/default.conf budgetcontrol-ms-authentication:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Workspace"
docker container cp microservices/Workspace/bin/apache/default.conf budgetcontrol-ms-workspace:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Stats"
docker container cp microservices/Stats/bin/apache/default.conf budgetcontrol-ms-stats:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Budget"
docker container cp microservices/Budget/bin/apache/default.conf budgetcontrol-ms-budget:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Entries"
docker container cp microservices/Entries/bin/apache/default.conf budgetcontrol-ms-entries:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Wallets"
docker container cp microservices/Wallets/bin/apache/default.conf budgetcontrol-ms-wallets:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Search Engine"
docker container cp microservices/SearchEngine/bin/apache/default.conf budgetcontrol-ms-searchengine:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Entry"
docker container cp microservices/Entries/bin/apache/default.conf budgetcontrol-ms-entries:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Labels"
docker container cp microservices/Labels/bin/apache/default.conf budgetcontrol-ms-labels:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Debt"
docker container cp microservices/Debt/bin/apache/default.conf budgetcontrol-ms-debt:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Savings"
docker container cp microservices/Savings/bin/apache/default.conf budgetcontrol-ms-savings:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Goals"
docker container cp microservices/Goals/bin/apache/default.conf budgetcontrol-ms-goals:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Notifications"
docker container cp microservices/Notifications/bin/apache/default.conf budgetcontrol-ms-notifications:/etc/apache2/sites-available/budgetcontrol.cloud.conf

echo "Build ms Jobs"


echo "Install composer and run migrations"
docker exec budgetcontrol-core composer install
docker exec budgetcontrol-core php artisan migrate
docker exec budgetcontrol-core php artisan optimize

docker exec budgetcontrol-gateway composer install
docker exec budgetcontrol-gateway php artisan optimize

docker exec budgetcontrol-ms-stats composer install
docker exec budgetcontrol-ms-authentication composer install
docker exec budgetcontrol-ms-jobs composer install
docker exec budgetcontrol-ms-workspace composer install
docker exec budgetcontrol-ms-budget composer install
docker exec budgetcontrol-ms-entries composer install
docker exec budgetcontrol-ms-wallets composer install
docker exec budgetcontrol-ms-searchengine composer install
docker exec budgetcontrol-ms-labels composer install
docker exec budgetcontrol-ms-debt composer install
docker exec budgetcontrol-ms-savings composer install
docker exec budgetcontrol-ms-goals composer install
docker exec budgetcontrol-ms-notifications composer install

echo "Restart all services"
docker container exec budgetcontrol-core service apache2 restart
docker container exec budgetcontrol-gateway service apache2 restart
docker container exec budgetcontrol-ms-authentication service apache2 restart
docker container exec budgetcontrol-ms-workspace service apache2 restart
docker container exec budgetcontrol-ms-stats service apache2 restart
docker container exec budgetcontrol-ms-budget service apache2 restart
docker container exec budgetcontrol-ms-entries service apache2 restart
docker container exec budgetcontrol-ms-wallets service apache2 restart
docker container exec budgetcontrol-ms-searchengine service apache2 restart
docker container exec budgetcontrol-ms-labels service apache2 restart
docker container exec budgetcontrol-ms-debt service apache2 restart
docker container exec budgetcontrol-ms-savings service apache2 restart
docker container exec budgetcontrol-ms-goals service apache2 restart
docker container exec budgetcontrol-ms-notifications service apache2 restart

docker container restart budgetcontrol-proxy

# Import database
echo "Install database"
docker exec budgetcontrol-ms-jobs bash -c "php console core:install"

echo "All done! Enjoy"
