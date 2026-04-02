#!/bin/bash
set -e  # зупиняє скрипт при помилці
 
cd my-post
docker build -t poshtanet-react --platform linux/amd64,linux/arm64 --build-arg VITE_API_BASE_URL=http://192.168.64.3:2488 .
docker tag poshtanet-react:latest utereskovi/poshtanet-react:latest
docker push utereskovi/poshtanet-react:latest
echo "Done ---client---!"
 
cd ../djangoapi
docker build -t poshtanet-django --platform linux/amd64,linux/arm64 .
docker tag poshtanet-django:latest utereskovi/poshtanet-django:latest
docker push utereskovi/poshtanet-django:latest
 
echo "Done ---api---!"
 
read -p "Press any key to exit..."