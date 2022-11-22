#install salt ubuntu 22.04

apt-get update -y
apt-get upgrade -y

sudo curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/3005/salt-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/3005 jammy main" | sudo tee /etc/apt/sources.list.d/salt.list


sudo apt update -y
sudo apt upgrade -y

sudo apt-get install salt-master -y
#sudo apt-get install salt-minion -y
#sudo apt-get install salt-ssh -y


#On minion, edit /etc/salt/minion.d/id.conf with minion name:
# # File:/etc/salt/minion.d/id.conf
# id: <minion name>
echo -e "# File:/etc/salt/minion.d/id.conf\nid: <minion name>" > id.conf

#On minion, edit /etc/salt/minion.d/salt.conf with IP of master:
# # File:/etc/salt/minion.d/salt.conf
# master: <ip of salt-master>
echo -e "# File:/etc/salt/minion.d/salt.conf\nmaster: <ip of salt-master>" > salt.conf


sudo systemctl enable salt-master && sudo systemctl start salt-master
#sudo systemctl enable salt-minion && sudo systemctl start salt-minion
systemctl status salt-master
#systemctl status salt-minion
