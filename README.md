# python-api-template

## Setup
```bash
docker compose up -d
```

## Run
The `docker compose up` command above actually builds the images and runs all of the containers, so that's all you need.

However, if you want to build individual images and run the containers manually, you can do something like the below:

```bash
docker build -t python-api-template .
docker rm -f python-api-container || true && docker run -d --name python-api-container -p 8000:8000 python-api-template
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