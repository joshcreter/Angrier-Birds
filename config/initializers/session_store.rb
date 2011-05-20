# Be sure to restart your server when you modify this file.

Abirds::Application.config.session_store :cookie_store, :key => '_abirds_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Abirds::Application.config.session_store :active_record_store



Abirds::Application.config.session = {
  :key          => '_omniauthpure_session',     # name of cookie that stores the data
  :domain       => nil,                         # you can share between subdomains here: '.communityguides.eu'
  :expire_after => 1.month,                     # expire cookie
  :secure       => false,                       # fore https if true
  :httponly     => true,                        # a measure against XSS attacks, prevent client side scripts from accessing the cookie
  
  :secret      => 'b819cd2c860af4c64caf7c7244b22a3e0638df87a9a1b084d1cd9c0b55d3b0b966707a01c93e72ea4e7a2ad49ba0735c4bafa49971b6c29ba05e2c146a245f78ra'
}