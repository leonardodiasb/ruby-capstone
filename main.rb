require_relative './music_album'
require_relative './genre'

class App
  def run
    puts 'This is the Catalog of my things App'
    puts '1 - List all music albums'
    puts '2 - List all genres'
    puts '3 - Add a music album'
    puts '4 - Exit'
    gets.chomp
  end

  def add_music_album(albums)
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Sources: '
    sources = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'No of years published: '
    date = gets.chomp
    albums.push(MusicAlbum.new(genre, author, sources, label, date))
    puts 'Album added successfully'
    puts ''
  end

  def list_music_albums(albums)
    albums.each do |a|
      puts "Genre: #{a.title}, Author: #{a.author}, Label: #{a.label}, No of years published: #{a.date}"
    end
    puts ''
  end

  def list_genre(genre)
    genre.each do |g|
      puts "Genre: #{g.name}"
    end
    puts ''
  end

  def main
    albums = []
    genre = []
    option = true
    while option
      case run
      when '1'
        add_music_album(albums)
      when '2'
        list_music_albums(albums)
      when '3'
        list_genre(genre)
      when '4'
        puts 'Thank you!'
        puts ''
        option = false
      else
        puts 'Kindly Choose a right number'
        puts ''
      end
    end
  end
end
main
