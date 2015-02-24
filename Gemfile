source 'https://rubygems.org'

ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use postgresql as the database for Active Record
gem 'pg'

gem 'therubyracer',  platforms: :ruby


# Use SCSS for stylesheets

gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes

gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'bootstrap_form'


# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails4-autocomplete'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'kaminari'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'devise', github: 'plataformatec/devise'
#gem 'omniauth'
gem 'koala'
gem 'omniauth-facebook'
gem 'omniauth-oauth2'
gem 'slim-rails'

group :development do
  gem 'thin'
end
group :production do
  gem 'rails_12factor'
  #gem 'passenger'
  gem 'unicorn'
  gem 'newrelic_rpm'
end

group :test do
  gem "factory_girl_rails"
  gem 'vcr'
  gem 'fakeweb'
  gem 'capybara-mechanize'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'pry-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  #gem 'rspec-rails'
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  gem 'dotenv-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'rack_session_access'
end
