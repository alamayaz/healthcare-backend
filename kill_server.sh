#!/bin/bash

# Find Django development server processes
echo "Looking for Django development server processes..."
PIDS=$(lsof -i :8000 -t)

if [ -z "$PIDS" ]; then
    echo "No Django server processes found on port 8000."
else
    echo "Found Django server processes with PIDs: $PIDS"
    echo "Killing processes..."
    kill -9 $PIDS
    echo "Processes terminated."
fi

echo "You can now start your containerized application with 'docker-compose up'" 