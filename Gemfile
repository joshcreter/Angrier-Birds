source :rubygems

gem "rails", "3.0.5"

gem "less", :git => "git://github.com/maccman/less.git"
gem "rack-less"
#gem "rack-sprockets"
gem "yui-compressor"
gem "supermodel"
gem "juggernaut"
gem "thin"
gem "omniauth"
gem "carrierwave"

=begin
gem "haml"
gem "high_voltage"
gem "hoptoad_notifier"
gem "RedCloth", :require => "redcloth"
gem "paperclip"
gem "will_paginate"
gem "validation_reflection"
gem "formtastic"
gem "flutie"
gem "dynamic_form"
gem "sass"
=end

gem "dalli"
gem "openid_dalli_store"
gem "eventmachine"

gem "rake", "0.8.7"
gem "sprockets"

group :development do
  gem "sqlite3"
end

group :producion do
  gem "pg"
end

=begin

# RSpec needs to be in :development group to expose generators
# and rake tasks without having to type RAILS_ENV=test.
group :development, :test do
  gem "rspec-rails", "~> 2.4.0"
  gem "ruby-debug",   :platforms => :mri_18
  gem "ruby-debug19", :platforms => :mri_19
end

group :test do
  gem "cucumber-rails"
  gem "factory_girl_rails"
  gem "bourne"
  gem "capybara"
  gem "database_cleaner"
  gem "fakeweb"
  gem "sham_rack"
  gem "nokogiri"
  gem "timecop"
  gem "treetop"
  gem "shoulda"
  gem "launchy"
  gem "akephalos"
  gem "thin"
end

=end