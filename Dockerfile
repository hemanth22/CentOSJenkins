FROM centos/systemd
MAINTAINER "Bitra Hemanth" <hemanthbitra@bitroid.in>
RUN yum update -y;yum install -y initscripts;yum install -y epel-release;yum install -y wget git gcc make gcc-c++ bash-completion-extras which;wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo;rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key;yum install -y nginx
CMD systemctl start nginx
RUN yum install -y jenkins java-1.8.0-openjdk
EXPOSE 8080
EXPOSE 50000
CMD ["/usr/sbin/init"]
