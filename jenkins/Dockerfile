FROM bitroid/centos:dind
COPY . .
RUN sh jenkins.sh
EXPOSE 8080
CMD systemctl start nginx
CMD ["/usr/sbin/init"]
