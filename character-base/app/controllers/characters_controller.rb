require './config/environment'

class CharactersController < Sinatra::Base

    configure do 
        set :views, 'app/views'
    end

    get '/characters' do 
        #redirect_if_not_logged_in

        #@characters = current_user.characters
        @characters = Character.all
        erb :'characters/index'
    end

    get '/characters/new' do
        erb :'characters/new'
    end

    post '/characters' do
        puts params
        @character = Character.new(params["character"])
        @character.save
        redirect to "/characters"
    end

    get '/characters/:id' do 
        @character = Character.find_by_id(params[:id])
        erb :'characters/show'
    end

    get '/characters/:id/edit' do
        @character = Character.find_by_id(params[:id])
        erb :'characters/edit'
    end

    patch '/characters/:id' do
        @character = Character.find_by_id(params[:id])
        @character.update(params[:character])
        @character.save
        redirect to "/characters/#{@character.id}"
    end
end