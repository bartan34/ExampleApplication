#!/usr/bin/env bash
sudo apt-get update && sudo apt-get install -y nodejs npm
sudo npm install -g pm2
pm2 stop example_app || true
cd "$HOME/ExampleApplication"
npm install
pm2 start ./bin/www --name example_app --env=production
pm2 save