FROM bitroid/centos:dind
COPY . .
RUN sh jenkins.sh
EXPOSE 8080
CMD ["/usr/sbin/init"]
