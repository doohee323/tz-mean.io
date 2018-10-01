#!/usr/bin/env bash

set -x

cd ..

export USER=`whoami`
export PROJ_NAME=mean
export HOME_DIR=/home/$USER
export PROJ_DIR=`pwd`
export SRC_DIR=${PROJ_DIR}/resources

export JWT_SECRET=jwt_test
export MONGO_HOST='mongodb://192.168.82.170:27017/new-mean'
export MONGO_PORT=27017

### [install nodejs] ############################################################################################################
#brew unlink node
brew install node@8
#brew link node@8
node -v
npm -v

### [install mean.io] ############################################################################################################
sudo npm install webpack -g
sudo npm install webpack-dev-server -g
sudo npm install node-gyp -g
sudo npm install node-pre-gyp -g
sudo npm install bcrypt -g

sudo npm install @angular/cli -g
sudo npm install typescript -g
sudo npm install ng -g

sudo rm -Rf mean
git clone https://github.com/linnovate/mean.git
cd ${PROJ_NAME}

#npm uninstall --save-dev webpack
#rm -rf node_modules
npm cache clean --force
npm cache verify
sudo rm -rf package-lock.json

npm install
npm install bcrypt

npm remove browserslist
npm install browserslist

npm rebuild
ng update @angular/cli
ng update @angular/core

ng build
ng serve

#sudo rsync -avP $PROJ_DIR/mean $HOME_DIR/mean
#cat <(crontab -l) <(echo "* * * * * sudo rsync -avP $PROJ_DIR/wordpress/ /usr/share/nginx/html/ && sudo chown -Rf www-data:www-data /usr/share/nginx/html") | crontab -



