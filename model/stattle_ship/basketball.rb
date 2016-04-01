require 'rest-client'

class StattleShipBasketball
  ACCESS_TOKEN = "235b7226da74698921f7421325c4e046"

  BASE_URI = "https://www.stattleship.com/"
  GAME_LOG_URI = "https://www.stattleship.com/basketball/nba/game_logs"

  def headers
    {
     "Content-Type" => "application/json",
     "Authorization" => "Token token=#{ACCESS_TOKEN}",
     "Accept" => "application/vnd.stattleship.com; version=1"
    }
  end

  def gamelogs
    response    = RestClient.get("#{GAME_LOG_URI}", headers)
    parsed_json = JSON[response]

    parsed_json["games"].map do |games|
      games["scoreline"]
    end
  end

  def teams
    response    = RestClient.get("#{BASE_URI}/basketball/nba/teams", headers)
    parsed_json = JSON[response]

    parsed_json["teams"].map do |team|
      team["nickname"]
    end
  end
end
