 source 'https://rubygems.org'

gem 'rails', '~>3.2.22.2'
gem 'rails_12factor'
gem 'haml-rails'
gem 'selenium-webdriver'
gem 'poltergeist'
gem 'authlogic'
gem 'twilio-ruby'
gem 'jquery-rails'
gem 'rubocop'
gem 'simplecov'
gem 'masonry-rails'
gem 'table_print'

# Normalize.css is a customisable CSS file that makes browsers render all
#   elements more consistently and in line with modern standards.
gem 'normalize-rails'

# In order to avoid the json 1.8.1 bug
#   (https://travis-ci.org/CSC322-Grinnell/notifications/jobs/110022386), force
#   an unbroken version
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
  gem 'rails_12factor'
end

# Gems used only for assets and not required
#   in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
