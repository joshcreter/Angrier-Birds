Rails.application.config.middleware.use OmniAuth::Builder do
#  provider :twitter, 'imkhJ6VxilZIA7AO36XpHg', 'FsFr1yuVI7RMp9O7v97j8dHkwSfFKeLMcgK74hyys', :sign_in => true

  require 'openid/store/filesystem'

  provider :facebook, '130768760334671', '64829ec2f2bd9e1724865f8882397cb6'
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :github, 'CLIENT ID', 'SECRET'

  # generic openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'

  # dedicated openid
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  # provider :google_apps, OpenID::Store::Filesystem.new('./tmp'), :name => 'google_apps'
  # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com

  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'myopenid', :identifier => 'myopenid.com'

# Sign-up urls for Facebook, Twitter, and Github
# https://developers.facebook.com/setup
# https://github.com/account/applications/new
# https://developer.twitter.com/apps/new

end