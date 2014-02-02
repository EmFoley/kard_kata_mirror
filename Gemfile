source 'https://rubygems.org'
ruby '1.9.3'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'

gem 'activesupport'
gem 'activerecord'

gem 'rake'

gem 'shotgun'
gem 'bcrypt-ruby'
gem 'rspec'
gem 'factory_girl'
gem 'faker'

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
end

group :development do
  gem 'pry'
  gem 'rspec'
end

group :test, :development do
  gem 'rspec'
  gem 'factory_girl'
  gem 'faker'
end
