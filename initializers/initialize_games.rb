class InitializeGames
  def initialize_games
    File.open('games.json', 'a')
    if File.read('games.json') != ''
      games = JSON.parse(File.read('games.json'))
      gamescollection = []
      games.each do |game|
        gam = Game.new(game['item_publish_date'], game['game_multiplayer'], game['game_last_played_at'])
        gam.id = game['id']
        gamescollection << gam
      end
      return gamescollection
    end
    []
  end

  def store_games(games)
    gamesjs = []
    games.each do |g|
      gamesjs << { 'json_class' => g.class, 'game_last_played_at' => g.last_played_at, 'author_first_name' => g.author.first_name, 'author_last_name' => g.author.last_name,
                   'game_multiplayer' => g.multiplayer, 'item_publish_date' => g.publish_date, 'id' => g.id }
    end
    File.write('games.json', JSON.generate(gamesjs))
  end
end
