# Build and Run the Docker Container:
# 
# Set the environment variables directly in the Docker run command and mount the secret files as volumes
# 

docker build -f Dockerfile --build-arg APP_VERSION=1.0.0 --build-arg BUILD_ENV=development -t simple-web-server .
