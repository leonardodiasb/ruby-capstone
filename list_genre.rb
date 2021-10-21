require_relative './genre'
class ListGenre
  def list_genre(genre)
    genre.push(Genre.new(name))
    if genre.empty?
      puts 'None'
      return false
    end
    genre.each do |g|
      puts "Genre: #{g.name}"
    end
    puts ''
  end
end
