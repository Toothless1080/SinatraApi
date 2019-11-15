require "sinatra"
require "sinatra/json"

require "net/http"
require "uri"
require "json"


get '/trending' do
uri = URI.parse("https://github-trending-api.now.sh/developers?language=javascript&since=weekly")

response = Net::HTTP.get_response(uri)
data = JSON.parse(response.body)

attribs = %w(name username type)
data.each do |item|
  item.delete_if{|k,v| !attribs.include?(k.to_s)}
end

data.each do |key, value|
  puts "#{key}"
end


  json data;
end