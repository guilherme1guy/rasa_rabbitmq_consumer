build:
	docker-compose build

run:
	docker-compose up -d rabbitmq rabbitmq-consumer

logs:
	docker-compose logs -f rabbitmq rabbitmq-consumer