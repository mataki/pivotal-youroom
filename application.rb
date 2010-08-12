require "rubygems"
require "sinatra"
# require "oauth"

set :logging, true

post "/" do
  # consumer_token = ENV["CTOKEN"]
  # consumer_secret = ENV["CSECRET"]
  # access_token = ENV["ATOKEN"]
  # access_secret = ENV["ASECRET"]

  # consumer = OAuth::Consumer.new(consumer_token, consumer_secret, :site => "https://www.youroom.in")
  # access = OAuth::AccessToken.new(consumer, access_token, access_secret)
  logger = env['rack.errors']
  logger.write request.body.read
end
