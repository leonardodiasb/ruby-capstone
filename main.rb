require_relative 'list_books'
require_relative 'list_labels'
require_relative 'list_games'
require_relative 'book_storage'
require_relative 'create_book'
require_relative 'create_game'
require_relative 'label_storage'
require_relative 'list_albums'
require_relative 'list_genre'
require_relative 'create_album'
require_relative 'genre'
require_relative 'item'
require_relative 'game'
require_relative 'initialize_games'
require 'json'
require 'io/console'

puts
puts 'This is my catalog app!'

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def main
  begin
    games_file = File.read('./games.json')
    @games = JSON.parse(games_file)
  rescue StandardError
    File.write('./games.json', JSON.dump([]))
    games_file = File.read('./games.json')
    @games = JSON.parse(games_file)
  end
  @all_genres = {}
  @all_authors = {}
  @all_labels = {}
  initialize_games
  input = ''

  while input.to_i != 13
    puts
    puts 'Please choose an option by entering a number:'
    puts
    puts ' 1 - List all books'
    puts ' 2 - List all music albums'
    puts ' 3 - List all games'
    puts ' 4 - List all genres (e.g \'Comedy\', \'Thriller\')'
    puts ' 5 - List all labels (e.g. \'Gift\', \'New\')'
    puts ' 6 - List all authors (e.g. \'Stephen King\')'
    puts ' 7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit'
    puts
    print 'Option: '
    input = gets.chomp

    case input
    when '1'
      list_books(@books)
    when '2'
      list_music_album(@music_album)

    when '3'
      list_games(@games)
    when '4'
      list_genres(@all_genres)
    when '5'
      list_labels(@all_labels)
    when '6'
      list_authors(@all_authors)

    when '7'
      create_book
    when '8'
      create_music_album

    when '9'
      create_game
    when '10'
      File.write('./data/games.json', JSON.dump(@games))
      thankyou
    else
      puts 'This option is not available'
    end
    if input.to_i >= 1 && input.to_i <= 8
      puts 'Press any key to contine...'
      $stdin.getch
    end
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity

main
