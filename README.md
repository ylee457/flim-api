
Pre-requisite:

This project is written in Rails 5 with Ruby 2.4. If you do not have either Ruby install, please install them. 
This project also uses RVM's feature of .ruby-gemset and .ruby-version files to set up the environment so it will
not conflict with other existing projects in the system.

Below are the simple steps to install Ruby using RVM:
rvm install ruby-2.4.0

Once you have Ruby 2.4.0 install, you are ready to run the example.

To run this example
Step 1: , please download the source code into your project folder and change directory to it, then do

bundle install

Step 2: Run bundle exec rake db:create

Step 3: Run bundle exec rake db:migrate

Step 4: To run the minitest tests for model, type:
bin/rails db:environment:set RAILS_ENV=test
bundle exec rake test:models

To run tests for controller
bundle exec rake test:controllers

To run all tests
bundle exec rake test

Step 5: To load fixture data into development database
bundle exec rake db:fixtures:load FIXTURES=flims

Step 6: To start up the Rails server in localhost
rails s


#To see the results using web browser
# to see list of flims, type:
http://localhost:3000/flims

# to see pagination support, type:
http://localhost:3000/flims?per_page=1&page=5
or
http://localhost:3000/flims?page[size]=1&page[number]=5

# to see a single flim, type:
localhost:3000/flims/:id
example,
http://localhost:3000/flims/998167417

step 7: Use cURL to test API.

# to submit rating for flim

curl  -i -H "Accept: application/vnd.api+json" -H "Content-Type: application/vnd.api+json" -X PUT -d '{ "flim": { "description": "This is a new test", "title": "I love traveling", "url_slug": "traveling"}, "rating": "5"}' "http://192.168.1.147:3000/flims/75439060"

# to retrive the updated result after the above step
curl -i -H "Accept: application/vnd.api+json" http://192.168.1.147:3000/flims/75439060


