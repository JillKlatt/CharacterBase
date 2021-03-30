require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    use Rack::Flash, :sweep => true
  end

  get "/" do
    erb :welcome
  end

  not_found do
    status 404
    erb :error
  end

  #error 404 do
  #  redirect '/'
  #end

  helpers do
    def current_user
      #make a memo rather than go back to long form every time
      @current_user ||= User.find_by_id(session["user_id"])
    end

    def logged_in?
      #is current user valid
      !!current_user
    end

    def redirect_if_already_logged_in
      redirect "/characters" if logged_in?
    end

    def redirect_if_not_logged_in
      redirect '/login' if !logged_in?
    end
  end


end
