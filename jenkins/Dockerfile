FROM centos/systemd:latest
RUN yum update -y;yum install -y initscripts;yum install -y epel-release;yum makecache fast;yum install -y wget yum-presto openssl ant mlocate vim curl git gcc make gcc-c++ bash-completion-extras which;yum install -y fpaste ansible-* java-1.8.0-openjdk
RUN ansible-galaxy install geerlingguy.nginx;ansible-galaxy install geerlingguy.jenkins;wget -O jenkinsinstaller.playbook https://git.io/jenkinsinstaller;ansible-playbook jenkinsinstaller.playbook
EXPOSE 8080
CMD systemctl start nginx
CMD ["/usr/sbin/init"]
