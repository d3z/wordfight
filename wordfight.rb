require 'rack/websocket'

class WordFight < Rack::WebSocket::Application
    @user=''
    def on_open(env)
        @user = env['PATH_INFO'].gsub('/','')
        close_websocket if @user.empty? or user_connected?
        puts "#{@user} is connected"
    end

    def on_close(env)
        puts "Closed connection to #{@user}"
    end

    def on_message(env, msg)
        puts "#{@user} said '#{msg}'"
    end

    def on_error(env, error)
    end

    def user_connected?
        return false
    end
end

