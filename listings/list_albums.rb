class ListAlbum
  def list_albums(albums)
    if albums.empty?
      puts 'No albums were found...'
      return false
    end
    albums.each do |a|
      puts "Album: #{a.title}, Author: #{a.author}, Label: #{a.label}, No of years published: #{a.date}"
    end
    puts ''
  end
end
