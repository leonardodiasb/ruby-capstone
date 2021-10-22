def list_games(games)
  puts
  puts ' GAMES '.center(IO.console.winsize[1], '-')
  puts 'No items created' if games.length.zero?
  games.each do |b|
    puts "[#{b['json_class']}] Genre: #{b['genre_name'].capitalize}, Author: #{b['author_first_name'].capitalize} #{b['author_last_name'].capitalize}, Label: #{b['label_title'].capitalize}-#{b['label_color'].capitalize}, Publish Date: #{b['item_publish_date'].capitalize}, Multiplayer: #{b['game_multiplayer']}, Last played at: #{b['game_last_played_at'].capitalize}, Moved to archived?: #{b['item_move_to_archive']}"
  end
  puts '-' * IO.console.winsize[1]
  puts
end
