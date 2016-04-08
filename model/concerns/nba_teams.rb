module NBATeams
  def find_nba_team_id(nickname)
    teams = {
      "Hawks"           => "atl",
      "Celtics"         => "bos",
      "Nets"            => "bk",
      "Hornets"         => "cha",
      "Bulls"           => "chi",
      "Cavaliers"       => "cle",
      "Mavericks"       => "dal",
      "Nuggets"         => "den",
      "Pistons"         => "det",
      "Warriors"        => "gs",
      "Rockets"         => "hou",
      "Pacers"          => "ind",
      "Clippers"        => "lac",
      "Lakers"          => "lal",
      "Grizzlies"       => "mem",
      "Heat"            => "mia",
      "Bucks"           => "mil",
      "Timberwolves"    => "min",
      "Pelicans"        => "no",
      "Knicks"          => "ny",
      "Thunder"         => "okc",
      "Magic"           => "orl",
      "76ers"           => "phi",
      "Suns"            => "pho",
      "Trail%20Blazers" => "por",
      "Kings"           => "sac",
      "Spurs"           => "sa",
      "Raptors"         => "tor",
      "Jazz"            => "uta",
      "Wizards"         => "was"
    }

    slug = add_league_prefix(nickname)
    teams[slug]
  end

  def add_league_prefix(team)
    "nba-#{team}"
  end
end
