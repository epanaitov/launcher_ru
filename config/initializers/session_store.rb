# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_launcha_session',
  :secret      => '23b737003ba2c2847ee9fb474bfc3b4b9f6082b21ebb257068ffffd88cac6096d518cd6b78093b0b301c3203f24c73c90cb3d12acc59d5d73e9b41efda3494a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
