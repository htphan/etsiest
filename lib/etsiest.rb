require "sinatra" 
require "etsiest/version"
require "etsy"
require "json"
require "pry"

Etsy.protocol = "https"
Etsy.api_key = ENV['ETSY_KEY']
enable :logging

module Etsiest
end

get '/etsy_search' do
  response = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => "#{params['q']}")
  @results = response.to_hash['results']
  erb :etsy_search
end
