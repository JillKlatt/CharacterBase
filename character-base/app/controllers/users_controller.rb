require './config/environment'

class UsersController < ApplicationController

    configure do 
    set :views, 'app/views'
    end

    get '/create_user' do
        redirect_if_already_logged_in
        erb :'users/new'
    end

    post '/create_user' do
        redirect_if_already_logged_in
        user = User.new(params[:user])
            if user.save 
                session["user_id"] = user.id 
                redirect '/characters'
            else
                redirect '/create_user'
            end
    end

    get '/login' do
        redirect_if_already_logged_in
        erb :'users/login'
    end

    post '/login' do 
        redirect_if_already_logged_in
        user = User.find_by(email: params[:user][:email])

            if user && user.authenticate(params[:user][:password])
                session["user_id"] = user.id 
                redirect '/characters'
            else
                redirect '/login'
            end
    end

    get '/logout' do
        redirect_if_not_logged_in
        session.delete("user_id")
        redirect '/login'
    end



end