require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:foodie_base.sqlite3"
 get '/' do 
 	erb :layout
 end
 get '/edit' do
 	erb :edit
 end
 get '/feed' do
 	erb :feed
 end
 get '/post' do
 	erb :post
 end
 get '/signup' do
 	erb :signup
 end

enable :sessions
