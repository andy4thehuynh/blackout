require 'rest-client'

class StattleShipBasketball
  ACCESS_TOKEN = "235b7226da74698921f7421325c4e046"
  URI = "https://www.stattleship.com/basketball/nba/game_logs"

  def headers
    {
     "Content-Type" => "application/json",
     "Authorization" => "Token token=#{ACCESS_TOKEN}",
     "Accept" => "application/vnd.stattleship.com; version=1"
    }
  end

  def get_game_logs
    response    = RestClient.get("#{URI}", headers)
    parsed_json = JSON[response]

    parsed_json["games"].map do |games|
      games["scoreline"]
    end
  end
end
