source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#ruby "3.2.2"
ruby "~> 3.2"
gem "rails", "~> 7.0.5"
gem "omniauth"
gem "omniauth-oauth2"
gem "rdoc"

gem "rails-controller-testing", github: "rails/rails-controller-testing"

gem "responders", "~> 3.1"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
# gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
# gem "sassc-rails"
gem "image_processing", "~> 1.2"
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'pagy', '~> 6.0', '>= 6.0.4'
gem 'tailwindcss-rails', '~> 2.0', '>= 2.0.29'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
group :development do
  gem "web-console"
  # gem "rack-mini-profiler"
  # gem "spring"
end
group :test do
  gem "omniauth-facebook"
  gem "omniauth-openid"
  gem "rexml"
  gem "timecop"
  gem "webrat", "0.7.3", require: false
  gem "mocha", "~> 1.1", require: false
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
platforms :ruby do
  #gem "sqlite3", "~> 1.4"
end

# platforms :jruby do
#   gem "activerecord-jdbc-adapter"
#   gem "activerecord-jdbcsqlite3-adapter"
#   gem "jruby-openssl"
# end

# TODO:
# group :mongoid do
#   gem "mongoid", "~> 4.0.0"
# end
#require 'debug'

# https://ddnexus.github.io/pagy/docs/extras
# https://ddnexus.github.io/pagy/docs/api/backend
#require 'pagy/extras/meilisearch'
#require 'pagy/extras/metadata'
#require 'pagy/extras/overflow'
#require 'pagy/extras/trim'

#Pagy::DEFAULT[:trim_extra] = false
#Pagy::DEFAULT[:items] = 7
#Pagy::DEFAULT[:metadata] = %i[first_url last_url]
#Pagy::DEFAULT[:overflow] = :empty_page

# Rails set up:
#require 'action_controller/railtie'
#require 'active_record'
#require 'minitest/autorun' # runs tests automatically
