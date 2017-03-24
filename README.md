
# Introduction
This project demonstrates the use of RESTFUL API with JSON in Rails. It also shows how to use pagination and sorting for the API. It is written in Rails 5 with Ruby 2.4. This project also uses RVM .ruby-gemset and .ruby-version files to set up the environment so it will not conflict with other existing projects in the system.

Here is a simple step to install Ruby using RVM:
_rvm install ruby-2.4.0_

# Try the Source Code
Once you installed Ruby 2.4.0, you are ready to run the example.

To run this example
Step 1: please download the source code into your project folder and change directory to it, then run:
_bundle install_

Step 2: Run 
_bundle exec rake db:create_

Step 3: Run 
_bundle exec rake db:migrate_

Step 4: To run the minitest tests for models, type:
_bin/rails db:environment:set RAILS_ENV=test_
_bundle exec rake test:models_

To run tests for controllers
_bundle exec rake test:controllers_

To run all tests
_bundle exec rake test_

Step 5: To load fixture data into the development database
_bundle exec rake db:fixtures:load FIXTURES=flims_

Step 6: To start up the Rails server in localhost
_rails s_


# Verifying results with a web browser

Here are some simple steps to see the results from the API

### to see list of flims, type:
http://localhost:3000/flims

### to see pagination support, type:
http://localhost:3000/flims?per_page=1&page=5
or
http://localhost:3000/flims?page[size]=1&page[number]=5

### to see a single flim, type:
localhost:3000/flims/:id
For example,
http://localhost:3000/flims/998167417

# Use CURL to test API.

### to submit rating for flim

curl  -i -H "Accept: application/vnd.api+json" -H "Content-Type: application/vnd.api+json" -X PUT -d '{ "flim": { "description": "This is a new test", "title": "I love traveling", "url_slug": "traveling"}, "rating": "5"}' "http://localhost:3000/flims/75439060"

### to retrive the updated result after the above step
curl -i -H "Accept: application/vnd.api+json" http://localhost:3000/flims/75439060

# See results in sorting with cURL

### sorting in ascending order
curl -i -H "Accept: application/vnd.api+json" -H "Content-type: application/json" -X GET -d '{"sort": "url_slug"}' http://localhost:3000/flims

### sorting in desending order
curl -i -H "Accept: application/vnd.api+json" -H "Content-type: application/json" -X GET -d '{"sort": "-url_slug"}' http://localhost:3000/flims


**_Enjoy And Happy Learning!_** -_**Yong**_
Please feel free to provide me feedback at ylee457@gmail.com