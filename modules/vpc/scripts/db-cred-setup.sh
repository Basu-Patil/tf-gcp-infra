#!/bin/bash

# go to the project directory and create a .env file
cd /opt/projects/webapp

# create a .env file
sudo touch .env

# write the environment variables to the .env file, take values from the terraform output
cat <<EOF | sudo tee .env > /dev/null
PORT=${port}
MYSQL_HOST=${db_host}
MYSQL_USER=${db_user}
MYSQL_PASSWORD=${db_pass}
MYSQL_DATABASE=${db_name}
DIALECT=${dialect}
MYSQL_PORT=${mysql_port}
NODE_ENV="production"
WEBAPP_URL = basavarajpatil.me
PUBSUB_TOPIC_URL = ${pubsub_url}
EOF

# Reload the systemd manager configuration
sudo systemctl daemon-reload