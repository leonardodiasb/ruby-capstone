require_relative '../classes/music_album'

describe MusicAlbum do
  context 'when a music album is available' do
    it 'can get access to its values' do
      new_album = MusicAlbum.new(20, title: 'Title')
      expect(new_album.on_spotify).to eq(true)
    end
  end
end
