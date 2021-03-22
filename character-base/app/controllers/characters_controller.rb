require './config/environment'

class CharactersController < Sinatra::Base

    get '/characters' do 
        redirect_if_not_logged_in

        @characters = current_user.characters
        erb :'characters/index'
    end

    get '/characters/new' do
        erb :'characters/new'
    end

    post '/characters/new' do
        @character = Character.create(params)
        redirect to "/characters/#{@character.id}"
    end

    get '/characters/:id' do 
        @character = Character.find_by_id(params[:id])
        erb :show
    end

    patch '/characters/:id' do
        @character = Character.find_by_id(params[:id])
        @character.name = params[:name]
        @character.age = params[:age]
        @character.race = params[:race]
        @character.class = params[:class]
        @character.special_abilities = params[:special_abilities]
        @cahracter.description = params[:description]
        @character.save
        redirect to "/characters/#{@character.id}"
    end
end