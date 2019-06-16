FROM bitroid/centos:dind
COPY . .
RUN yum update -y;yum install -y initscripts;yum install -y epel-release;yum install -y wget yum-presto openssl ant mlocate vim curl git gcc make gcc-c++ bash-completion-extras which;yum install -y nginx fpaste ansible-* java-1.8.0-openjdk
RUN ansible-galaxy install geerlingguy.nginx;ansible-galaxy install geerlingguy.jenkins; wget -O jenkinsinstaller.playbook https://gist.githubusercontent.com/hemanth22/12c97105bdc99e8c699b44e39548fd37/raw/4614d104038bb08cc531a1ec4dde6688b4e40568/jenkinsinstaller.playbook; ansible-playbook jenkinsinstaller.playbook; ansible-galaxy install hemanth22.butler; wget -O butler.playbook https://gist.githubusercontent.com/hemanth22/003728968edf17785f646e81015d4bbe/raw/4a80f64dfb7ba71b919c7de44914fd78deb156eb/butler.playbook; ansible-playbook butler.playbook; yum install -y bcrypt docker-compose; useradd docker; usermod -a -G docker jenkins; usermod -a -G dockerroot jenkins
EXPOSE 8080
CMD systemctl start nginx
CMD ["/usr/sbin/init"]
