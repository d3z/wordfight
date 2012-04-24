require 'rubygems'
require 'sinatra/base'
require 'haml'

class WordFightWeb < Sinatra::Base

    get '/' do
        haml :index
    end

end
