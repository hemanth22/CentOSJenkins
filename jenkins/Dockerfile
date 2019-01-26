
RUN yum update -y;yum install -y initscripts;yum install -y epel-release;yum install -y wget yum-presto openssl ant mlocate vim curl git gcc make gcc-c++ bash-completion-extras which;yum install -y fpaste ansible-* java-1.8.0-openjdk
RUN ansible-galaxy install geerlingguy.nginx;ansible-galaxy install geerlingguy.jenkins; wget -O jenkinsinstaller.playbook https://gist.githubusercontent.com/hemanth22/12c97105bdc99e8c699b44e39548fd37/raw/25d84ef7a171e1dd27ec1f90bd07b679567cd6ea/jenkinsinstaller.playbook; ansible-playbook jenkinsinstaller.playbook
EXPOSE 8080
EXPOSE 50000
CMD systemctl start nginx
CMD ["/usr/sbin/init"]
