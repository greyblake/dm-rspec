source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"
gem 'dm-core'
gem 'dm-validations'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development do
  gem "rspec", "~> 3.0.0"
  gem "bundler"
  gem "jeweler"
  gem "reek"
  gem 'guard-rspec', :require => false
  gem 'libnotify' if RUBY_PLATFORM =~ /linux/

  gem 'dm-migrations'
  gem 'dm-sqlite-adapter'
end
