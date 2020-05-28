source 'https://rubygems.org'
ruby '2.3.1'
# ruby-gemset=projectmosul
# Standard Rails gems
gem 'rails', '4.2.8'
gem 'sass-rails', '~> 5.0'
gem 'haml-rails'
gem 'uglifier', '~> 3.0'
gem 'therubyracer'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.2'
gem 'turbolinks', '2.5.3'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.6'
gem 'bcrypt', '~> 3.1'
gem 'bower-rails', '~> 0.11'
gem 'nokogiri', '~> 1.8.1'

# Necessary for Windows OS (won't install on *nix systems)
gem 'tzinfo-data', platforms: [:mingw, :mswin]
# Kaminari: https://github.com/amatsuda/kaminari
gem 'kaminari', '~> 1.2'

# Friendly_id: https://github.com/norman/friendly_id
gem 'friendly_id', '~> 5.2'

# Font-awesome: https://github.com/FortAwesome/font-awesome-sass
gem 'font-awesome-sass', '~> 4.7'

# Bootstrap 3: https://github.com/twbs/bootstrap-sass
gem 'bootstrap-sass', '~> 3.3'
gem 'rmagick', '~> 2.15'
gem 'paperclip', '4.3.6'
gem 'aws-sdk', '< 2.0'
gem 'paper_trail', '~> 5.1'

gem 'dropzonejs-rails'

# for now, until we decide if we want to use this in production or not
gem 'pg'
# gem 'dotenv-rails'
gem 'twitter-bootstrap-rails'
gem 'will_paginate'
# gem 'will_paginate-bootstrap'

gem 'sketchfably', git: 'https://github.com/neshmi/sketchfably.git'
gem 'rails_admin'
gem 'rubyzip', '~> 1.2'
gem 'flickraw'
gem 'geokit'
# Devise: https://github.com/plataformatec/devise
gem 'devise', '~> 3.5.10'
gem 'rollbar', '~> 2.14'
gem 'newrelic_rpm'
gem 'coveralls', require: false
gem 'le'
gem 'cocaine', '~> 0.5'
# For API
# gem 'doorkeeper' # To include when it comes time to add authentication

## Google Maps Integration
gem 'markerclustererplus-rails'
gem 'underscore-rails'
gem 'geonames_api'

# ActiveJob
# gem 'sidekiq'
# gem 'sinatra', :require => nil

# donations
gem 'stripe'
gem 'mail', '~> 2.6.6.rc1'

gem 'ng-rails-csrf'

group :production, :staging do
  gem 'puma', '~> 3.4'
  gem 'puma_worker_killer'
end

group :development do
  gem 'web-console', '~> 3.1'
end

group :development, :test do
  gem 'pandoc-ruby'
  gem 'byebug', '~> 9'
  gem 'awesome_print'
  gem 'pry-rails'

  # Figaro: https://github.com/laserlemon/figaro
  gem 'figaro', '~> 1.1'

  # Spring: https://github.com/rails/spring
  # gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-bundler', require: false
  gem 'guard-migrate', require: false
  gem 'guard-spring'
  gem 'capybara'
  gem 'fuubar'
  gem 'factory_girl_rails'
  gem 'rspec-given'
  gem 'rspec-activejob'
  gem 'codeclimate-test-reporter', require: nil
  gem 'rubocop', require: false
  gem 'faker'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'compass-rails'
  gem 'single_cov'
end
