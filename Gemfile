source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma'

# Redis stores for Ruby on Rails (Cache, Session)
gem 'redis-rails'

# Use Devise as authentication users
gem 'devise', '~> 3.4'

# Support OAuth providers
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-github', '~> 1.1.2'

# Internationalization
gem 'rails-i18n',  '~> 4.0.0'
gem 'devise-i18n', '~> 0.10'

# Use haml as view template
gem 'haml-rails', '~> 0.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

source 'https://rails-assets.org' do
  # Use jQuery
  gem 'rails-assets-jquery'
  gem 'rails-assets-jquery-ujs'

  # Bootstrap themes
  gem 'rails-assets-bootswatch'
end

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
end
