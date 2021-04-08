# install nvidia-docker
sudo apt-get update
sudo apt-get install curl
curl -fsSL https://get.docker.com | sh && sudo systemctl --now enable docker
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

# install compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo wget \
       https://dvc.org/deb/dvc.list \
       -O /etc/apt/sources.list.d/dvc.list

# install dvc
wget -qO - https://dvc.org/deb/iterative.asc | sudo apt-key add -
sudo apt update
sudo apt install dvc

# cloning repos
git clone https://github.com/sirius-yandex-nlp-team/laughing_net.git ~
cd ~/laughing_net
git checkout TASK-6
git submodule update --init