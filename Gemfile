source 'https://rubygems.org'
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.5'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

# Redis stores for Ruby on Rails (Cache, Session)
gem 'redis-rails'

# Use Devise as authentication users
gem 'devise', '>= 3.5.4'

# Support OAuth providers
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-github', '~> 1.1.2'
gem 'omniauth-facebook', '~> 2.0.0'

# Internationalization
gem 'rails-i18n',  '~> 4.0.0'
gem 'devise-i18n', '~> 0.10'

# Use Slim as view template
gem 'slim'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 2.7.2'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

source 'https://rails-assets.org' do
  # Use jQuery
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'

  # UI frameworks
  gem 'rails-assets-bootstrap'
  gem 'rails-assets-fontawesome'
end

# Take a peek into Rails application.
gem 'peek'
gem 'peek-git'
gem 'peek-performance_bar'
gem 'peek-pg'
gem 'peek-redis'
gem 'peek-gc'
gem 'peek-rblineprof'

group :doc do
  # Documantation
  gem 'yard'

  # `bundle exec rake erd` generates ERD ouput to erd.pdf
  gem 'rails-erd'
end

group :development, :test do
  # Using application preloader
  gem 'spring'

  # `bundle exec rake spec` runs specs under spec/.
  gem 'rspec-rails', '~> 3.1'

  # Load environment variables from `.env` into `ENV`
  gem 'dotenv-rails'
end

group :development do
  # Call 'byebug' in the code to stop execution and get a debugger console
  gem 'byebug'

  # Rails Pry initializer
  gem 'pry-rails'

  # Pritty print to Ruby objects on IRB, Pry.
  gem 'awesome_print'

  # A mini view framework for console/irb that's easy to use
  gem 'hirb'
  gem 'hirb-unicode' # Support unicode characters

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Better error page for Rack apps
  gem 'better_errors'

  # Mutes assets pipeline log messages.
  gem 'quiet_assets'

  # Format SQL and parameters in the Rails log.
  gem 'rails-flog', require: 'flog'

  # Manage Procfile-based applications
  gem 'foreman'
end

group :test do
  # Coveralls for Ruby
  gem 'coveralls'
end

group :production do
  # Makes running your Rails app easier on Heroku
  gem 'rails_12factor'

  # Enable gzip compression on heroku, but don't compress images.
  gem 'heroku-deflater'

  # Management performance of Rails application
  gem 'newrelic_rpm'
end
gem 'nokogiri', '>= 1.6.7.2'
gem 'rails-html-sanitizer', '~> 1.0.3'
