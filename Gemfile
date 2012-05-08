source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'jquery-rails'
gem 'bcrypt-ruby', '3.0.1'
gem 'date_validator', '~> 0.6.3'
gem 'paperclip', '~> 2.7'
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'

gem 'unicorn'

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '~> 3.0'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.9.0'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'aws-s3'
  gem 'aws-sdk'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
  gem 'less'
end