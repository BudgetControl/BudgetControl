#!/bin/bash

# Set the default environment
env="dev"

# List of repositories to clone
repositories=(
  "git@github.com:BudgetControl/Entries.git"
  "git@github.com:BudgetControl/Authentication.git"
  "git@github.com:BudgetControl/Workspace.git"
  "git@github.com:BudgetControl/Stats.git"
  "git@github.com:BudgetControl/Budget.git"
  "git@github.com:BudgetControl/Wallets.git"
  "git@github.com:BudgetControl/SearchEngine.git"
  "git@github.com:BudgetControl/Labels.git"
  "git@github.com:BudgetControl/CommandJobs.git"
  "git@github.com:BudgetControl/Gateway.git"
  "git@github.com:BudgetControl/Debt.git"
  "git@github.com:BudgetControl/Core.git"
)

# Clone repositories if they do not exist
for repo in "${repositories[@]}"; do
  repo_name=$(basename "$repo" .git)
  if [ ! -d "microservices/$repo_name" ]; then
    echo "Cloning $repo_name..."
    git clone "$repo" "microservices/$repo_name"
  else
    echo "$repo_name already exists. Skipping clone."
  fi
done

# Copy .env.example to .env for each repository
for repo in "${repositories[@]}"; do
  repo_name=$(basename "$repo" .git)
  if [ -d "microservices/$repo_name" ]; then
    if [ -f "microservices/$repo_name/.env" ]; then
      echo ".env file already exist for $repo_name"
    else
      cp "microservices/$repo_name/.env.example" "microservices/$repo_name/.env"
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
  dev)
    echo "Setting up DEV environment"
    docker compose -f docker-compose.yml -f docker-compose.db.yml -f docker-compose.dev.yml up -d    
    ;;
  prod)
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

docker compose down

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

docker container restart budgetcontrol-proxy

# Import database
echo "Importing database"
docker cp bin/db/budgetV2.sql budgetcontrol-db:/budgetV2.sql
docker exec budgetcontrol-db bash -c "mysql -uroot -prootpasswordthebestway budgetV2 < /budgetV2.sql"

echo "All done! Enjoy"
