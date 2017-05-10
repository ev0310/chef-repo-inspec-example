# Alternatively you can install the ChefDK instead of using this Gemfile.
source 'https://rubygems.org'

if chefversion = ENV['CHEF_VERSION']
  gem 'chef', chefversion
else
  gem 'chef'
end

gem 'test-kitchen'
gem 'berkshelf'

group :test do
  gem 'chefspec'
  gem 'rubocop'
  gem 'foodcritic'
end

group :integration do
  gem 'inspec'
  gem 'kitchen-inspec'
  gem 'kitchen-vagrant'
end
