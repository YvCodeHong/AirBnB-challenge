require 'sinatra/base'
require 'uri'
require 'sinatra/flash'
require './lib/listing'

class BnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
end
  get '/listings' do
    @listings = Listing.all
    erb(:listings)
  end

  get '/listings/new' do
    erb(:listings_new)
  end

  post '/listings/new' do
    Listing.create(params['name'], params['description'], params['price'])
    redirect '/listings'
  end

  get '/users/new' do
    erb(:users_new)
  end 
end
