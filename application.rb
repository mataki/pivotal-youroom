require "rubygems"
require "sinatra"
require "oauth"
require 'hpricot'

set :logging, true

post "/" do
  consumer_token = ENV["CTOKEN"]
  consumer_secret = ENV["CSECRET"]
  access_token = ENV["ATOKEN"]
  access_secret = ENV["ASECRET"]

  consumer = OAuth::Consumer.new(consumer_token, consumer_secret, :site => "https://www.youroom.in")
  access = OAuth::AccessToken.new(consumer, access_token, access_secret)

  doc = Hpricot(request.body.read)
  content = doc.at('activity').at('description').innerHTML

  logger = env['rack.errors']
  logger.write request.body.read

  resp = access.post('https://www.youroom.in/r/308/entries?format=json', { "entry[content]" => content })
  logger.write "-" * 30
  logger.write resp.to_s
  resp
end
