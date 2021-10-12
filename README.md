# PokePan
## Description
A Ruby on Rails API which consumes data from PokeApi.co, process data and returns JSON to the end user.

PokePan create request to PokeAapi, skips first 100 Pokémon and takes the next 10.
PokemonService parses the response to JSON, iterates over every entry, extract the needed information and creates record in the database.
There are validations if Pokémon or Type is existing in database. 
After we have Pokémon records in the database, the next step is to get every one of them (including the association type that it has, since we want to avoid n+1 query) and put it through a Decorator (Draper) to convert it to JSON only with attributes we need. Finally, we render the array as a JSON.

For #show action of specific Pokémon the process is simpler - we should already have the database of Pokémon, the set_pokemon method sets the object we should render, then we just pass it to decorator in show action and render it as a JSON. There are two methods which decorator uses, so we can display additional information - one for #index action and one for #show.

There are rspecs which validates the fields - if it has record, if its length exceed 255 characters, if associations are valid, etc.

One simple view is created - it represents the home page.

#### The project is deployed with Heroku and GitHub: https://pokepan.herokuapp.com/
#### It has GitHub action that runs rspecs on push to main

##### Versions used:
Ruby v.2.7.0
Rails v.6.1.4.1
RubyGems v.3.1.2
RVM v.1.29.12
PostgreSQL v.12.8


### HOW TO INSTALL
#### Install RVM or RBENV
##### Install RVM
Install RVM (Ruby enVironment (Version) Manager) on Ubuntu following the steps in this GitHub repository: https://github.com/rvm/ubuntu_rvm 
To install RVM at any other OS, please follow the steps on this link: https://rvm.io/rvm/install
##### Install RBENV
Follow the steps in RBENV GitHub repository: https://github.com/rbenv/rbenv#installation

#### Install Ruby
Second step is to install Ruby v.2.7.0:
```sh
rvm install ruby-2.7.0 # for 'rvm'
rbenv install 2.7.0 # for 'rbenv'
```
		
Next, you need to set this version to be the default one (since we can have more than one version of Ruby installed):
		rvm use ruby-2.7.0 # 'rvm' switch to specified Ruby version
		rbenv local 2.7.0 # 'rbenv' switch to specified Ruby version

#### Install Bundler
The third step is to install Bundler v2.1.2:
```sh
gem install bundler -v 2.1.2
```
			
#### Clone repository
Then clone the repository:
```sh
git clone https://github.com/ImPanayotov/Pokemon.git
```
Checkout to main:
```sh
git checkout main
```
And run:
```sh
bundle install
```			
#### Install and Set Up PostgreSQL
Follow the steps in the tutorial: https://www.postgresql.org/docs/12/tutorial-install.html
And run:
```sh
rails db:setup
```
### USAGE
#### Running RSpecs:
```sh
rails rspec
```
or
```sh
bundle exec rspec
```
	
#### Test endpoints:
```sh
rails s # Starting web server Puma
```
##### Can be tested with Postman API: https://www.postman.com/impanayotov90/workspace/pokepan/request (the JSON with requests is exported to root folder of PokePan API - 'PokePan API.postman_collection.json')
##### Also through https://pokepan.herokuapp.com:
- '/' returns welcome page with basic HTML page which helps to test the other endpoints
- '/pokemons' returns a list of Pokémon as a JSON
- '/pokemons/:poke_id', for example: '/pokemons/101' returns #show action of Pokémon with Poke_id 101 as a JSON (currently we have poke id's in the 101..110 range)
- '/update-pokemons' updates the list of Pokémon

##### Swagger API documentation: https://app.swaggerhub.com/apis/pokepan/PokePan/1.0.0
		