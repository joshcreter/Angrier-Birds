require 'omniauth/openid'
#require 'openid/store/memcache'

require 'openid/store/filesystem'
    
Rails.application.config.middleware.use OmniAuth::Builder do   
   # load certificates
#   require "openid/fetchers"
#   OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
    
   # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here
   provider :facebook, 'APP_ID', 'APP_SECRET'
   provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
   provider :github, 'CLIENT ID', 'SECRET'
           
    # dedicated openid
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol', :identifier => 'openid.aol.com'
    
end