class ListGenre
  def list_genre(genre)
    count = 0
    if genre.empty?
      puts 'No genre were found...'
      return false
    end
    genre.each do |e|
      puts "#{count}) Genre: #{e.name}"
      count += 1
    end
  end
end
