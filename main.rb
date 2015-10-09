require 'sinatra'
require 'sinatra/activerecord'
require './models'
enable :sessions

set :database, "sqlite3:foodie_base.sqlite3"

def add_user(params)
	User.create(fname:params[:first_name], lname:params[:last_name],uname:params[:username],password: params[:password],email:params[:email],location:params[:location])
end
def add_post(params)
	Post.create(name:params[:enter_name],subject:params[:topic_subject],body:params[:text_body])
end
def delete_account(params)
	User.destroy(5)
end


def current_user
    if session[:user_id]
        @current_user=User.find(session[:user_id])
    end
end

 get '/' do 
 	erb :layout
 end
 get '/edit' do
 	erb :edit
 end
 get '/mini_feed' do
 	erb :feed
 end
 get '/post' do
 	erb :post
 end
 get '/signup' do
 	erb :signup
 end

post "/sign_up" do
 	add_user(params)
    
end

post "/log_out" do
    session[:username]=nil
    redirect"/signup"
end

post "/log_in" do
    @user=User.where(uname: params[:username]).first
    if @user.password == params[:password]
        session[:username] = @user.uname 
        puts current_user
        redirect "/mini_feed"
    else 
        redirect "/signup"
    end
end

post "/post_feed" do
	add_post(params)
end
