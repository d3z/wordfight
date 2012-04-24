require 'rack/websocket'
require './cache.rb'

class WordFight < Rack::WebSocket::Application
    def on_open(env)
        @user = env['PATH_INFO'].gsub('/','')
        close_websocket if @user.empty? or Cache::connection_cached_for?(@user)
        puts "#{@user} is connected"
        Cache::cache_connection_for(@user, self)
    end

    def on_close(env)
        puts "Closed connection to #{@user}"
        Cache::remove_connection_for(@user)
    end

    def on_message(env, msg)
        to_user, data = msg.split(':')
        puts "#{@user} is sending '#{data}' to #{to_user}"
        Cache::get_connection_for(to_user).send_data(data)
    end

    def on_error(env, error)
    end

end

