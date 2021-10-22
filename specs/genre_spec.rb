require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  context 'Check for music genres' do
    it 'can access the genres of music and check item array length' do
      genre = Genre.new('Comedy')
      album = MusicAlbum.new(24, title: 'Test', on_spotify: true)
      genre.add_item(album)
      expect(genre.items.empty?).to eq(false)
    end
  end
end
