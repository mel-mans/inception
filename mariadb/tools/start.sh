#!/bin/bash
set -e

# Start MariaDB in background
mysqld_safe &

# Wait for server to be ready
sleep 10

# Run init script
./init-db.sh

# Bring MariaDB to foreground (so container stays running)
wait %1
