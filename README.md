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
		npm install && npm start
```

-. Open web sites
```
	<for Vagrant>
		- node
			http://192.168.82.170:4040
		- nginx
			http://192.168.82.170
```

# AngularMaterial

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 1.7.4.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `-prod` flag for a production build.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via [Protractor](http://www.protractortest.org/).

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI README](https://github.com/angular/angular-cli/blob/master/README.md).

#trigger build