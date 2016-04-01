require 'cuba'
require 'cuba/contrib'
require 'mote'
require 'json'
require 'rest-client'

require './model/stattle_ship/basketball'

Cuba.plugin Cuba::Mote

Cuba.define do
  stattle_ship_basketball = StattleShipBasketball.new

  on get do
    on root do
      render("index")
    end

    on "choose_team" do
      render("choose_team")
    end

    on "gamelogs" do
      res.write stattle_ship_basketball.get_game_logs
    end
  end
end
