# Docker-stack-with-dockerhub-images.

```text
---
version: '3.7'
services:
  nginx:
    image: bitroid/intelliwebsite:nginx
    volumes:
      - "/home/bhemanth/ubuntuintelli/nginx:/var/www/html"
    ports:
      - "92:80"
    networks:
      - over-layone
    deploy:
      replicas: 1
      update_config:
        parallelism: 2
        delay: 10s
      restart_policy:
        condition: on-failure
        max_attempts: 3
      placement:
        constraints:
          - node.role == manager
  apache:
    image: bitroid/intelliwebsite:apache
    volumes:
      - "/home/bhemanth/ubuntuintelli/apache:/var/www/html"
    ports:
      - "91:80"
    networks:
      - over-layone
    depends_on:
      - nginx
    deploy:
      replicas: 1
      update_config:
        parallelism: 1
        delay: 120s
      restart_policy:
        condition: on-failure
        max_attempts: 3
      placement:
        constraints:
          - node.role == manager
networks:
  over-layone:
```

Command to execute this stack file.

`docker swarm init --advertise-addr 192.168.166.1:2377 --listen-addr 192.168.166.1:2377`

`docker stack deploy website -c website.yml`

`docker stack ps website`

`docker stack rm website`

