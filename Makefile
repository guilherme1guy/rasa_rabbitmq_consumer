build:
	docker-compose build

run:
	docker-compose up -d rabbitmq rabbitmq-consumer

stop:
	docker-compose down

logs:
	docker-compose logs -f rabbitmq rabbitmq-consumer

setup:
	docker network create -d bridge chatbot-consumer-network