class CreateGame
  def choose_author(authors)
    count = 0
    puts 'Select one author from the list:'
    authors.each do |a|
      puts "#{count + 1}) First Name: #{a.first_name}, Last Name: #{a.last_name}"
      count += 1
    end
    puts ' '
    puts 'Or create a new author by hitting the enter key'
    author = gets.chomp
    if author == ''
      create_new_author(authors)
    elsif author.to_i.zero?
      puts ' '
      puts 'Option is not available. Choose a number in the list: '
      choose_author(authors)
    elsif author.to_i <= count
      authors[author.to_i - 1]
    else
      puts 'Option is not available. Choose a number in the list: '
      choose_author(authors)
    end
  end

  def create_new_author(authors)
    puts 'What is the author first name? '
    first_name = gets.chomp
    puts 'What is the author last name? '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name)
    authors << new_author
    new_author
  end

  def create_game(games, authors)
    # Game Data
    print 'Multiplayer (e.g. yes or no): '
    game_multiplayer = gets.chomp.downcase
    print 'Game publish date: (Format: YYYY-MM-DD): '
    game_publish_date = gets.chomp.downcase
    print 'Last played at: (Format: YYYY-MM-DD): '
    game_last_played_at = gets.chomp.downcase
    game_multiplayer_boolean = true
    game_multiplayer_boolean = false if game_multiplayer.downcase == 'no'

    puts '----------------------'
    new_author = choose_author(authors)
    new_game = Game.new(game_publish_date, game_multiplayer_boolean, game_last_played_at)
    new_author.add_item(new_game)
    games.push(new_game)
    puts "\nSuccess!\n"
  end
end
