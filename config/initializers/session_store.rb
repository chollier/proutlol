# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_proutlol_session',
  :secret      => 'ccad885327067b5960952a2558506bfe955ce3ec6b31f610fdaaaf98f8627241a9b3ac1dc6a85aea17a2be4309c53d2e356812d35c0fdd86217e33768a9011a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
