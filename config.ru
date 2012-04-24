require './wordfightweb.rb'
require './wordfight.rb'

map '/' do
    run WordFightWeb
end

map '/ws' do
    run WordFight.new
end
