source 'https://rubygems.org'

gem 'rails', '3.2.16'
gem 'rails_12factor'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml-rails'

gem 'selenium-webdriver'
gem 'poltergeist'

gem 'authlogic'#, :git => "git://github.com/binarylogic/authlogic.git"

gem 'twilio-ruby'

gem 'rubocop'
gem 'simplecov'

# Normalize.css is a customisable CSS file that makes browsers render all elements more consistently and in line with modern standards.
gem 'normalize-rails'

# In order to avoid the json 1.8.1 bug (https://travis-ci.org/CSC322-Grinnell/notifications/jobs/110022386), force an unbroken version
  gem 'json', '~>1.8.2'

group :development, :test do
  gem 'sqlite3'
  gem 'pry-byebug'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'test-unit'
end

group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  # CodeClimate reports test coverage and scores the DRYness and readibility of
  #  the project.
  gem 'codeclimate-test-reporter'
end

group :production do
  gem 'pg'
  gem 'heroku'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
