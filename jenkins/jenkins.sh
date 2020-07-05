echo "Update Base OS"
yum update -y
echo "Initscripts"
yum install -y initscripts
echo "Extra Packages for Enterprise Linux"
yum install -y epel-release
echo "Pre-requiste"
yum install -y wget yum-presto openssl ant mlocate vim curl git gcc make gcc-c++ bash-completion-extras which tree
yum install -y nginx fpaste ansible java-1.8.0-openjdk
echo "Install playbook"
ansible-galaxy install geerlingguy.nginx
ansible-galaxy install geerlingguy.jenkins
ansible-galaxy install geerlingguy.java
ansible-galaxy install hemanth22.butler
echo "Provisining Jenkins"
wget -O jenkinsinstaller.playbook https://gist.githubusercontent.com/hemanth22/12c97105bdc99e8c699b44e39548fd37/raw/4614d104038bb08cc531a1ec4dde6688b4e40568/jenkinsinstaller.playbook
ansible-playbook jenkinsinstaller.playbook
echo "Provisining Bulter"
wget -O butler.playbook https://gist.githubusercontent.com/hemanth22/003728968edf17785f646e81015d4bbe/raw/4a80f64dfb7ba71b919c7de44914fd78deb156eb/butler.playbook
ansible-playbook butler.playbook
echo "Install extra plugins for jenkins and docker"
yum install -y bcrypt docker-compose
echo "Adding user"
useradd docker
echo "Granting docker privilage to jenkins"
usermod -a -G docker jenkins
usermod -a -G dockerroot jenkins