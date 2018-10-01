#!/usr/bin/env bash

set -x

export USER=vagrant  # for vagrant
export PROJ_NAME=mean
export HOME_DIR=/home/$USER
export PROJ_DIR=/vagrant
export SRC_DIR=/vagrant/resources  # for vagrant

export JWT_SECRET=jwt_test
export MONGO_HOST='mongodb://127.0.0.1:27017/new-mean'
export MONGO_PORT=27017

sudo sh -c "echo '' >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export PATH=$PATH:.' >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export USER='$USER >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export HOME_DIR='$HOME_DIR >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export PROJ_DIR='$PROJ_DIR >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export SRC_DIR='$SRC_DIR >> $HOME_DIR/.bashrc"

sudo sh -c "echo 'export JWT_SECRET=jwt_test' >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export MONGO_HOST=mongodb://127.0.0.1:27017/new-mean' >> $HOME_DIR/.bashrc"
sudo sh -c "echo 'export MONGO_PORT=27017' >> $HOME_DIR/.bashrc"
source $HOME_DIR/.bashrc

### [install mongodb] ##########################################################################################################
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get update
sudo apt-get install -y mongodb-org --allow-unauthenticated -y
sudo service mongod restart

### [install nodejs] ############################################################################################################
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
node -v

sudo apt-get install npm -y
sudo apt-get install build-essential libssl-dev -y
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o install_nvm.sh
sudo bash install_nvm.sh
nvm install 8.12.0
npm -v

### [install nginx] ############################################################################################################
sudo apt-get install nginx -y

sudo cp -Rf $SRC_DIR/nginx/default /etc/nginx/sites-available
# curl http://127.1.0.1:80
sudo service nginx restart

### [install mean.io] ############################################################################################################
sudo mkdir -p $HOME_DIR
cd $HOME_DIR

sudo npm install typescript -g
sudo npm install ng -g
sudo npm install node-gyp -g
sudo npm install bcrypt -g
sudo npm install -g @angular/cli

sudo rm -Rf mean
sudo rm -Rf node_modules
git clone https://github.com/linnovate/mean.git
cd mean
sudo npm install --unsafe-perm=true --allow-root
sudo npm audit fix --force

sudo chown -Rf vagrant:vagrant ${HOME_DIR}/mean/
sudo chown -Rf vagrant:vagrant ${HOME_DIR}/.config
sudo npm update

sudo npm rebuild
sudo npm rebuild node-sass

ng update @angular/cli
ng update @angular/core
npm install
sudo npm audit fix --force

#npm install mini-css-extract-plugin

#sudo npm remove webpack
#sudo npm install webpack@4.11.1

ng build

nohup npm start > out.log 2>&1 &

cd $PROJ_DIR
git clone https://github.com/linnovate/mean.git

#sudo rsync -avP $PROJ_DIR/mean $HOME_DIR/mean
#cat <(crontab -l) <(echo "* * * * * sudo rsync -avP $PROJ_DIR/wordpress/ /usr/share/nginx/html/ && sudo chown -Rf www-data:www-data /usr/share/nginx/html") | crontab -



