require 'rubygems'
require 'sinatra/base'
require 'haml'
require 'json'
require './cache.rb'

class WordFightWeb < Sinatra::Base

    get '/' do
        haml :index
    end

    get '/users' do
        @users = Cache::who_is_connected?
        content_type 'application/json', :charset=>'utf-8'
        JSON(@users)
    end

end
