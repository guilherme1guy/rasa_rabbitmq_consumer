# rasa_rabbitmq_consumer
Based on the rabbitmq module from https://github.com/lappis-unb/rasa-ptbr-boilerplate


# Usage

First edit docker-compose.yml and change the users, passwords and urls to the correct ones.

## Using on the same machine as the Rasa service
If your chatbot project will run in the same machine as the consumer create a docker network and expose the Rasa and Elasticsearch service of your bot to the consumer.

Network creation:
```
$ docker network create -d bridge chatbot-consumer-network
```
You can also run `make setup` on this project to call the command above


Example:
```
services:
...
  rasa:
    ...
    ports:
      - 5005:5005
    networks:
      - chatbot-consumer-network
      - default
... 
  elasticsearch:
    ports:
      - 9200:9200
      - 9300:9300
    networks:
      - chatbot-consumer-network
      - default

...
networks:
  default:
    external:
      name: chatbot-consumer-network
```

Also setup the consumer docker-compose with a network like this:
```
networks:
  default:
    external:
      name: chatbot-consumer-network
```

You can use `docker network ls` to see the current networks on the machine and check the correct name to use.

Finally, configure the Rasa endpoints:
```
event_broker:
  url: rabbitmq
  username: admin
  password: admin
  queue: bot_messages
```
Since we are sharing the same docker network, we can reach the container by its name.

## Using on separate machines
In this case, check if the network traffic between your Rasa, consumer and Elasticsearch instances is allowed and configure using the correct addresses.

And on Rasa endpoints, set the event_broker url to point to your consumer instance (on the rabbitmq port)
