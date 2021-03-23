class SessionsController < ApplicationController

    get '/login' do
        redirect_if_already_logged_in
        erb :'sessions/login'
    end

    post '/login' do 
        redirect_if_already_logged_in
        user = User.find_by(email: params[:user][:email])

            if user && user.authenticate(params[:user][:password])
                session["user_id"] = user.id 
                redirect '/characters'
            else
                #False (Flash message, incorrect password)
                redirect '/login'
            end
    end

    get '/logout' do
        redirect_if_not_logged_in
        session.delete("user_id")
        redirect '/login'
    end

end