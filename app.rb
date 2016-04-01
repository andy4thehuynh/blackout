require 'cuba'
require 'cuba/contrib'
require 'mote'
require 'json'
require 'rest-client'

require './model/stattle_ship/basketball'

Cuba.plugin Cuba::Mote
Cuba.use Rack::Static, urls: %w[/js /css /img], root: File.expand_path("./public", __dir__)

Cuba.define do
  on get do
    on root do
      render("index")
    end

    on "teams", param("sport") do |sport|
      render("teams", teams: StattleShipBasketball.new.teams)
    end

    on "scores", param("blackout") do |obfuscate_this_team|
      render("scores", scores: StattleShipBasketball.new.scores)
    end
  end
end
