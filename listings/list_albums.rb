class ListAlbum
  def list_albums(albums)
    count = 0
    if albums.empty?
      puts 'No albums were found...'
      return false
    end
    albums.each do |a|
      puts "#{count}) Album: #{a.title}, Is on Spotify: #{a.on_spotify}"
      count += 1
    end
  end
end
