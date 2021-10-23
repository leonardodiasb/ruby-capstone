require 'json'

class MusicAlbumStorage
  def load_music_albums
    File.open('music_albums.json', 'a')
    if File.read('music_albums.json') != ''
      music_albums = JSON.parse(File.read('music_albums.json'))
      music_albumscollection = []
      music_albums.each do |music_album|
        ma = MusicAlbum.new(music_album['publish_date'], on_spotify: music_album['on_spotify'], title: music_album['title'])
        ma.id = music_album['id']
        music_albumscollection << ma
      end
      return music_albumscollection
    end
    []
  end

  def store_music_albums(music_albums)
    music_albumsjs = []
    music_albums.each do |e|
      music_albumsjs << { 'on_spotify' => e.on_spotify, 'title' => e.title, 'publish_date' => e.publish_date,
                          'id' => e.id }
    end
    File.write('music_albums.json', JSON.generate(music_albumsjs))
  end
end
