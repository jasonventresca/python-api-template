# python-api-template

## Setup
```bash
docker compose up -d
```

## Run
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