require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    #set :views, Proc.new { File.join(root, "../views/") }
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
