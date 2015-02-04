source 'https://rubygems.org'
ruby '2.1.1'
# ruby-gemset=successfulness

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
gem "paperclip", "~> 4.2"
# Use MySQL as the database for Active Record
# gem 'pg'
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# Bootstrap 3
gem 'bootstrap-sass', '~> 3.1.1'
# For Payment Gateway in future
gem 'activemerchant'
# Account Manager
gem 'puma'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '~> 5.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

group :development do
  gem 'faker', '1.2.0'
  # gem 'rspec-rails', '2.14.0'
  gem 'guard-rspec', '4.2.0'
  gem 'letter_opener' # serve as local email
  gem 'byebug'
  gem 'quiet_assets' # Quiet Assets turns off the Rails asset pipeline log.
  gem "better_errors" # Handles errors
  gem "binding_of_caller" # optional plusing for better errors
  gem 'meta_request' # Chrome Rails panel
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
group :test do
  gem 'selenium-webdriver', '2.38.0'
  gem 'capybara', '2.2.0'
  gem 'factory_girl_rails' , '4.3.0'
end


gem 'tzinfo-data', platforms: [:x64_mingw,:mingw, :mswin]

gem 'rails_12factor', group: :production

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
