# docker-sensu-server

## Pre-Requisites

* [docker-redis](http://github.com/roobert/docker-redis)
* [docker-rabbitmq](http://github.com/roobert/docker-rabbitmq)
* [docker-sensu](http://github.com/roobert/docker-sensu)

## Post-Requisites

* [docker-uchiwa](http://github.com/roobert/docker-uchiwa)

## Build
```
docker build -t sensu-server .
```

## Run
```
docker run \
  --name sensu-server \
  -d \
  --link redis \
  --link rabbitmq \
  -e TRANSPORT_NAME=rabbitmq \
  -e RABBITMQ_URL=amqp://rabbitmq:5672 \
  -e REDIS_URL=redis://redis:6379 \
  -e SENSU_SERVICE=server \
  -v ./data:/sensu \
  sensu
```

## Compose
```
docker-compose up -d
```

## Test
```
docker logs sensu-server
docker exec -it redis redis-cli get leader
```
