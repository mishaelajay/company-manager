# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# An implementation of nested set for storing hierarchical data
gem 'awesome_nested_set'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Support for country names
gem 'country_select', '~> 6.0'

# To create forms easily
gem 'simple_form'

group :development, :test do
  # Prints Ruby objects in full color exposing their internal structure with
  # proper indentation.
  # https://github.com/awesome-print/awesome_print
  gem 'awesome_print'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # A Ruby gem to load environment variables from `.env`.
  # https://github.com/bkeepers/dotenv
  gem 'dotenv-rails'
  # A library for setting up Ruby objects as test data.
  # https://github.com/thoughtbot/factory_bot
  gem 'factory_bot'
  # A library for generating fake data such as names, addresses, and phone
  # numbers. https://github.com/stympy/faker
  gem 'faker'
end

group :development do
  # A static analysis security vulnerability scanner for Ruby on Rails
  # applications. https://github.com/presidentbeef/brakeman
  gem 'brakeman', require: false
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'

  # vulnerability checker for Ruby itself.
  # https://github.com/civisanalytics/ruby_audit
  gem 'ruby_audit', require: false
  # A Ruby static code analyzer, based on the community Ruby style guide.
  # https://github.com/bbatsov/rubocop.
  gem 'rubocop', require: false
  # An extension of RuboCop focused on code performance checks.
  # https://github.com/rubocop-hq/rubocop-performance
  gem 'rubocop-performance', require: false
  # A RuboCop extension focused on enforcing Rails best practices and coding
  # conventions. https://github.com/rubocop-hq/rubocop-rails
  gem 'rubocop-rails', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # Minitest reporter plugin for CircleCI.
  # https://github.com/circleci/minitest-ci
  gem 'minitest-ci'
  # Mocha is a mocking and stubbing library for Ruby.
  # https://github.com/freerange/mocha
  gem 'mocha'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  # https://github.com/bblimke/webmock
  gem 'webmock'
  # For replaying HTTP requests
  # https://github.com/myronmarston/vcr
  gem 'vcr'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
