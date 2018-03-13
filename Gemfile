# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Ruby version
ruby '2.5.0'

gem 'bootstrap', '~> 4.0.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'haml-rails', '~> 1.0'
gem 'haml_lint', require: false
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'overcommit'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.5'
gem 'rubocop-rails'
gem 'sass-rails', '~> 5.0'
gem 'scss_lint'
gem 'travis'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
