source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'

gem 'puma'
gem 'clearance'
gem 'haml'

gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'simple_form'

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry'
  gem 'byebug'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'activerecord_sane_schema_dumper'
  gem 'quiet_assets'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

group :test do
  gem 'factory_girl_rails'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'db-query-matchers'
  gem 'faker'
end
