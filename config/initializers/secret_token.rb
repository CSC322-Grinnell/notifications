# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
HeadStart::Application.config.secret_token = "efa3869936769cd13cdbb5e2825bc7e02b8919bcaaa6
34dd06413d6aa59b85f24c5ea877a8610ee930d8b2761b5
bdcace0f0c2d08b52d4b8b51ccc3c5d7711d9"
 #Rails.env.development? or Rails.env.test?
  #('x' * 30) # meets minimum requirement of 30 chars long
#else
 # ENV['SECRET_TOKEN']
#end
