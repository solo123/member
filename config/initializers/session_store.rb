# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_member_session',
  :secret      => '66753e0362ae27698a0e85ff15c893dab001e2e4534d5e4126860e514791ca18a52d6bddb0ed701a79d4e89c067f19bbf724df17b6247146de561470a7b5aadf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
