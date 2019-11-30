# Website Repository

Intellipath Docker assignment 1

Ubuntu dockerfile with apache code as below.

```text
FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
COPY * /var/www/html/
EXPOSE 80
CMD ["apache2ctl", "-D","FOREGROUND"]
```

Ubuntu dockerfile with nginx code as below.

```text
FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
COPY * /var/www/html/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
```

Website: [https://github.com/hemanth22/website.git](https://github.com/hemanth22/website.git)

