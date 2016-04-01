require 'cuba'
require 'rest-client'
require 'json'

require './model/stattle_ship/basketball'

# Routes
Cuba.define do
  stattle_ship_basketball = StattleShipBasketball.new

  on get do
    on root do
      res.write "Choose your team"
    end

    on "gamelogs" do
      res.write stattle_ship_basketball.get_game_logs
    end
  end
end
