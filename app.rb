require 'sinatra/base'
require 'tilt/erb'
require './lib/computer'
require './lib/player'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/play' do
    player = Player.new(params[:player])
    @game = Game.new(player)
    erb(:play)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
