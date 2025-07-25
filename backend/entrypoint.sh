#!/bin/bash
set -e

# Wait for database to be ready
until mysqladmin ping -h"$DATABASE_HOST" -u"$DATABASE_USERNAME" -p"$DATABASE_PASSWORD" --silent; do
  echo "Waiting for database connection..."
  sleep 2
done

# Create database if it doesn't exist
bundle exec rails db:create

# Run migrations
bundle exec rails db:migrate

# Start the main process
exec "$@"