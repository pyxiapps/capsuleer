source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'mysql2'
gem 'jquery-rails'
gem "thin", ">= 1.5.0", :group => :production
gem "haml", ">= 3.1.7"
gem "devise", ">= 2.2.2"
gem "figaro", ">= 0.5.3"

gem "unicorn", ">= 4.3.1", :group => [:development, :test]
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "factory_girl_rails", ">= 4.1.0", :group => [:development, :test]

group :assets do
  gem "bootstrap-sass"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem "launchy", ">= 2.1.2"
  gem "capybara", ">= 2.0.2"
  gem "simplecov", :require => false
  gem "simplecov-rcov", :require => false
  gem "cucumber-rails", ">= 1.3.0", :require => false
end

group :development do
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem "haml-rails", ">= 0.3.5"
  gem "hpricot", ">= 0.8.6"
  gem "ruby_parser", ">= 3.1.1"
  gem "quiet_assets", ">= 1.0.1"
end
