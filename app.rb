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

    on "choose_team" do
      render("choose_team")
    end

    on "gamelogs" do
      render("gamelogs", gamelogs: stattle_ship_basketball.get_game_logs)
    end
  end
end
