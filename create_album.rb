class CreateAlbum
  def create_album(albums)
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Sources: '
    sources = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'No of years published: '
    date = gets.chomp.to_i
    albums.push(MusicAlbum.new(genre, author, sources, label, date))
    puts 'Album added successfully'
    puts ''
  end
end
