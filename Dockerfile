FROM centos/systemd
MAINTAINER "Bitra Hemanth" <hemanthbitra@bitroid.in>
RUN yum update -y;yum install -y initscripts;yum install -y epel-release;yum install -y wget yum-presto openssl ant mlocate vim curl git gcc make gcc-c++ bash-completion-extras which;wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo;rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key;yum install -y nginx
CMD systemctl start nginx
RUN yum install -y jenkins java-1.8.0-openjdk
COPY jobs /var/lib/jenkins/jobs/
#RUN wget -O http://0.0.0.0:8080/jnlpJars/jenkins-cli.jar
#RUN java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin github-api github-oauth email-ext webhook-step badge
EXPOSE 8080
EXPOSE 50000
CMD ["/usr/sbin/init"]
