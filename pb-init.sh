#!/bin/sh

# Start PocketBase in the background
/pb/pocketbase serve --http=0.0.0.0:8080 &

# Wait for PocketBase to be ready
sleep 5

# Create superuser if environment variables are set
if [ -n "$SUPERUSER_EMAIL" ] && [ -n "$SUPERUSER_PASSWORD" ]; then
  /pb/pocketbase superuser create "$SUPERUSER_EMAIL" "$SUPERUSER_PASSWORD"
else
  echo "SUPERUSER_EMAIL or SUPERUSER_PASSWORD not set. Skipping superuser creation."
fi

# Keep the container running
wait
