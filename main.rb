require_relative './classes/item'
require_relative './creators/create_book'
require_relative './creators/create_game'
require_relative './creators/create_album'
require_relative './listings/list_books'
require_relative './listings/list_labels'
require_relative './listings/list_games'
require_relative './listings/list_authors'
require_relative './listings/list_albums'
require_relative './listings/list_genres'
require_relative './initializers/initialize_games'
require_relative './initializers/book_storage'
require_relative './initializers/label_storage'
require_relative './initializers/author_storage'
require_relative './initializers/music_album_storage'
require_relative './initializers/genre_storage'
require_relative './classes/label'
require_relative './classes/author'
require_relative './classes/genre'
require_relative './classes/book'
require_relative './classes/game'
require_relative './classes/music_album'
require 'json'
puts
puts 'This is my catalog app!'

class App
  def initialize
    @books = BookStorage.new.load_books
    @labels = LabelStorage.new.load_labels(@books)
    @games = InitializeGames.new.initialize_games
    @authors = AuthorStorage.new.load_authors(@games)
    @albums = MusicAlbumStorage.new.load_music_albums
    @genres = GenreStorage.new.load_genres(@albums)
  end

  def continuefunc
    puts ' '
    puts 'Press any key to continue...'
    puts ' '
    $stdin.gets
  end

  def run
    message = [' ', 'This is the Catalog of my things App', ' ', 'Please choose an option by entering a number:',
               ' 1 - List all books', ' 2 - List all music albums', ' 3 - List all games', ' 4 - List all genres ',
               ' 5 - List all labels ', ' 6 - List all authors ', ' 7 - Add a book', ' 8 - Add a music album', ' 9 - Add a game', ' 10 - Exit']
    message.each { |e| puts e }
    option = gets.chomp
    case option
    when '1'
      puts `clear`
      ListBooks.new.list_books(@books)
      continuefunc
      run
    when '2'
      puts `clear`
      ListAlbum.new.list_albums(@albums)
      continuefunc
      run
    when '3'
      puts `clear`
      ListGames.new.list_games(@games)
      continuefunc
      run
    when '4'
      puts `clear`
      ListGenre.new.list_genre(@genres)
      continuefunc
      run
    when '5'
      puts `clear`
      ListLabels.new.list_labels(@labels)
      continuefunc
      run
    when '6'
      puts `clear`
      ListAuthors.new.list_authors(@authors)
      continuefunc
      run
    when '7'
      puts `clear`
      CreateBook.new.create_book(@books, @labels)
      continuefunc
      run
    when '8'
      puts `clear`
      CreateAlbum.new.create_music_album(@albums, @genres)
      continuefunc
      run
    when '9'
      puts `clear`
      CreateGame.new.create_game(@games, @authors)
      continuefunc
      run
    when '10'
      InitializeGames.new.store_games(@games)
      BookStorage.new.store_books(@books)
      LabelStorage.new.store_labels(@labels)
      AuthorStorage.new.store_authors(@authors)
      MusicAlbumStorage.new.store_music_albums(@albums)
      GenreStorage.new.store_genres(@genres)
      puts 'Thank you for using this app'
    else
      puts 'This option is not available'
      continuefunc
      run
    end
  end
end

def main
  app = App.new
  app.run
end

main
