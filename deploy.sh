#!/usr/bin/env bash
# Update packages and install Node.js + npm
sudo apt-get update && sudo apt-get install -y nodejs npm

# Install pm2 (production process manager for Node.js)
sudo npm install -g pm2

# Stop the application if it is already running (may not exist on first deploy)
pm2 stop example_app || true

# Go to the freshly cloned application folder
cd "$HOME/ExampleApplication"

# Install application dependencies
npm install

# Start the application with the process name example_app
pm2 start ./bin/www --name example_app --env=production

# Persist the process list so it survives an instance restart
pm2 save
