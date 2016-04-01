require 'cuba'
require 'cuba/contrib'
require 'mote'
require 'json'
require 'rest-client'

require './model/stattle_ship/basketball'

Cuba.plugin Cuba::Mote
Cuba.use Rack::Static, urls: %w[/js /css /img], root: File.expand_path("./public", __dir__)

Cuba.define do
  stattle_ship_basketball = StattleShipBasketball.new

  on get do
    on root do
      render("index")
    end

    on "gamelogs" do
      render("gamelogs", gamelogs: stattle_ship_basketball.get_game_logs)
    end
  end

  on "league" do
    # Future, make a base StattleShip class and pass in league
    on post, param("nba") do |league|
      render("league", teams: StattleShipBasketball.new.teams)
    end
  end

  on "gamelogs" do
    on post do
      render("gamelogs", gamelogs: StattleShipBasketball.new.gamelogs)
    end
  end
end
