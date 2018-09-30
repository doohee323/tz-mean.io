## Run on Vagrant

-. Prep.
```
    - install vagrant
        https://www.vagrantup.com/downloads.html
    - install virtualbox
        https://www.virtualbox.org/
```

-. Set up on vagrant
```
    git clone https://github.com/doohee323/tz-mean
    cd tz-mean
	vagrant destroy -f && vagrant up
	vagrant ssh
	cf. all scripts
		/tz-mean/scripts/mean.sh
```

-. Run mongodb
```
	<for Vagrant>
		sudo service mongod restart 
```

-. Run node server
```
	<for Vagrant>
		vagrant ssh
		cd /vagrant/mean
		npm install && npm start
		
		- node
			http://192.168.82.170:4040
		- nginx
			http://192.168.82.170
		
	<for local>
		cd ~/tz-mean.io/scripts
		bash local.sh
		
		# for debugging
		ng serve
		http://localhost:4200/
		
		# Code scaffolding
		Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.
		
		# Build
		ng build
		
		# Running unit tests
		Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).
		
		# Running end-to-end tests
		Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).
		
		# Further help
		To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).
```
