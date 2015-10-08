require 'sinatra'
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
 get 'signup' do
 	erb :signup
 end

