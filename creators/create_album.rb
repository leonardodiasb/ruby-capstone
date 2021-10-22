class CreateAlbum
  def on_spotify_fn
    print 'Is this album on Spotify? [(T)rue,(F)alse]: '
    on_spotify = gets.chomp.downcase
    case on_spotify
    when 't'
      true
    when 'f'
      false
    else
      puts "Option is not available, please enter 'T' for True or 'F' for False "
      on_spotify_fn
    end
  end

  def choose_genre(genres)
    count = 0
    puts 'Select one genre from the list:'
    genres.each do |e|
      puts "#{count + 1}) Name: #{e.name}"
      count += 1
    end
    puts ' '
    puts 'Or create a new genre by hitting the enter key'
    genre = gets.chomp
    if genre == ''
      create_new_genre(genres)
    elsif genre.to_i.zero?
      puts ' '
      puts 'Option is not available. Choose a number in the list: '
      choose_genre(genres)
    elsif genre.to_i <= count
      genres[genre.to_i - 1]
    else
      puts 'Option is not available. Choose a number in the list: '
      choose_genre(genres)
    end
  end

  def create_new_genre(genres)
    puts 'What is the genre name? '
    name = gets.chomp
    new_genre = Genre.new(name)
    genres << new_genre
    new_genre
  end

  def create_music_album(music_albums, genres)
    print 'What is the album title name? '
    title = gets.chomp
    on_spotify = on_spotify_fn
    print 'When was the publish date? '
    date = gets.chomp.to_i
    puts '---------------------'
    new_genre = choose_genre(genres)
    new_music_album = MusicAlbum.new(date, on_spotify: on_spotify, title: title)
    new_genre.add_item(new_music_album)
    music_albums << new_music_album
    puts ' '
    puts 'Music Album created successfully'
  end
end
