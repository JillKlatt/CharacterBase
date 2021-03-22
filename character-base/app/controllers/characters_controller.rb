require './config/environment'

class CharactersController < Sinatra::Base

    get '/characters' do 
        redirect_if_not_logged_in

        @characters = current_user.characters
        erb :'characters/index'
    end

end