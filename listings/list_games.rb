class ListGames
  def list_games(games)
    count = 0
    if games.empty?
      puts 'No games were found...'
      return false
    end
    games.each do |e|
      puts "#{count}) Publish Date: #{e.publish_date}, Multiplayer: #{e.multiplayer}, Last Played: #{e.last_played_at}"
      count += 1
    end
  end
end
