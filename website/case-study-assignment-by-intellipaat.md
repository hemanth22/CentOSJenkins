# Case-study-assignment-by-intellipaat

Dynamically changing the index file with volume command.

`docker run -d -p 91:80 -v /home/bhemanth/ubuntuintelli/apache:/var/www/html --name=apache docker.pkg.github.com/hemanth22/website/webpage:2.1`

`docker run -d -p 92:80 -v /home/bhemanth/ubuntuintelli/nginx:/var/www/html --name=nginx docker.pkg.github.com/hemanth22/website/webpage:1.0`

**stackfile.yml**

```text
---
version: '3.7'
services:
  nginx:
    image: docker.pkg.github.com/hemanth22/website/webpage:1.0
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
    image: docker.pkg.github.com/hemanth22/website/webpage:2.1
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

Commands to execute.

`docker stack deploy website -c stackfile.yml`

`docker stack ps website`

`docker stack rm website`

