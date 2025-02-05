#!/bin/bash

echo "🚀 Starting deployment process..."

# Original commands
echo hi123
sh 'chmod +x build.sh'
sh './build.sh'

# Docker login with old credentials
docker login -u ar8888 -p dckr_pat_HU8f1bsQJp3j2DnCttXuuoppo7w

# Tag and push old image
docker tag test ar8888/ar
docker push ar8888/ar

# New deployment process
echo "⚙️ Building the Docker image..."
docker build -t custom-nginx .

# Docker login with new credentials
docker login -u mohamedathikr -p qwerty786!A

# Tag the new image
docker tag custom-nginx mohamedathikr/jenkins_docker

# Push the new image
echo "🚀 Pushing the Docker image to Docker Hub..."
docker push mohamedathikr/jenkins_docker

# Run the container on port 80
echo "🔥 Running the Docker container on port 80..."
docker run -d -p 80:80 --name custom-nginx-container mohamedathikr/jenkins_docker

echo "✅ Deployment completed successfully!"
