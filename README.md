# python-api-template

## Setup
```bash
# For production mode
docker compose up api -d

# For development mode (with hot reload)
docker compose up api-dev
```

## Run
The `docker compose up` command above actually builds the images and runs all of the containers, so that's all you need.

In development mode (`api-dev`), any changes to your Python files will automatically reload the application.

For production mode (`api`), you'll need to rebuild the image to reflect code changes:
```bash
docker compose build api
docker compose up api -d
```

However, if you want to build individual images and run the containers manually, you can do 
something like the below:
```bash
docker build -t python-api-template .
docker rm -f python-api-container || true && docker run -d --name python-api-container -p 
8000:8000 python-api-template
docker ps
docker logs python-api-container --follow
```

## Test
```bash
curl -X GET "http://localhost:8000/example" -H "Authorization: Bearer token"
```

## Cleaning up
```bash
docker compose down

docker ps -a
docker rm -f $(docker ps -a -q) # Be careful! This removes all containers.
docker rmi $(docker images -q) # Be careful! This removes all images.

# If you want to remove EVERYTHING including volumes (be extra careful!) you can just do:
docker system prune -a # Removes all images, containers, and volumes.
```