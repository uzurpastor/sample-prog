source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

gem "rails", "~> 7.0.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false
gem "bootstrap-sass" 

gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem "bcrypt", "~> 3.1.7"
gem 'faker'

=begin 
  gem 'activeadmin'

  gem 'devise'
  gem 'cancancan'
  gem 'draper'
  gem 'pundit'
=end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end

group :test do
  gem 'rails-controller-testing'
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'net-http'
end
