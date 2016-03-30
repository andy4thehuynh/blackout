require 'cuba'
require 'rest-client'

ACCESS_TOKEN = "235b7226da74698921f7421325c4e046"
CLIENT_SECRET = "5f6be5d9f062c2c3bdcb9658727b8fae42727ee09ddb2fd5a9ed545e13ec487d"
CLIENT_ID = "177ec179e1b829c889bac3f0f5d570a3"

class StattleShipBasketball
  BASE_URL = "https://www.stattleship.com/basketball/nba/game_logs"

  def get_game_logs
    RestClient.get("#{BASE_URL}", { "Content-Type" => "application/json", "Authorization" => "Token token=#{ACCESS_TOKEN}", "Accept" => "application/vnd.stattleship.com; version=1" })
  end
end

Cuba.define do
  stattle_ship_basketball = StattleShipBasketball.new

  on get do
    on root do
      res.write stattle_ship_basketball.get_game_logs
    end
  end
end
