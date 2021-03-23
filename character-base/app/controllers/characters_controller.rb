require './config/environment'

class CharactersController < ApplicationController

    configure do 
        set :views, 'app/views'
    end

    get '/characters' do 
        redirect_if_not_logged_in

        @characters = current_user.characters
        erb :'characters/index'
    end

    get '/characters/new' do
        redirect_if_not_logged_in

        erb :'characters/new'
    end

    post '/characters' do
        redirect_if_not_logged_in
        #puts params
        # @character = Character.new(params["character"])
        # @character.save
        #character = current_user.characters.build([params["character"]])
        new_character = Character.new(params[:character])
        new_character.user_id = current_user.id
        #binding.pry
        if new_character.save
            redirect "/characters/#{new_character.id}"
        else
            #Error message
            redirect to "/characters/new"
        end
    end

    get '/characters/:id' do 
        redirect_if_not_authorized
        @character = Character.find_by_id(params[:id])
        erb :'characters/show'
    end

    get '/characters/:id/edit' do
        redirect_if_not_authorized
        @character = Character.find_by_id(params[:id])
        erb :'characters/edit'
    end

    patch '/characters/:id' do
        redirect_if_not_authorized
        @character = Character.find_by_id(params[:id])
        @character.update(params[:character])
        @character.save
        redirect to "/characters/#{@character.id}"
    end

    delete '/characters/:id' do 
        redirect_if_not_authorized
        @character = Character.find_by_id(params[:id])
        @character.destroy
        redirect to '/characters'
    end

    private

    def redirect_if_not_authorized
        @character = Character.find_by_id(params[:id])
        if @character.user_id != session["user_id"]
            redirect "/characters"
        end
    end
end