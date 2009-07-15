# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_handicappr_session',
  :secret      => 'ac35ab602c9eab673b4a086e1f3ae332a63d293cd36706a0053b720216dba6a1ee588c6b616ed71eff23b4a08a1ab7e7d954730bf4ab0bfc97a09b7f771d0a61'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
