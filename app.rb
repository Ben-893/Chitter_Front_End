require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './lib/user'
require 'pry'

class ChitterFrontEnd < Sinatra::Base
  register Sinatra::Flash
  set :method_override, true
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    erb :index
  end

  post '/sign-up' do
    User.create_user(params["handle"], params["password"])
    redirect '/'
  end

  post '/sign-in' do
    user = User.sign_in(params["handle"], params["password"])
    if user
      session[:user_id] = user['user_id']
      session[:session_key] = user['session_key']
    end
    redirect '/'
  end
end