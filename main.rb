require 'sinatra'

enable :sessions
 
get '/' do 
 	erb:layout
end

 
