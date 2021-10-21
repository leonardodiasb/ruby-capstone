require_relative './music_album'

describe MusicAlbum do
  context 'when a music album is available' do
    it 'can get access to its values' do
      new_album = MusicAlbum.new('action', 'Lee Yin', 'sources', 'label', 20)
      expect(new_album.genre).to eq('action')
      expect(new_album.author).to eq('Lee Yin')
      expect(new_album.on_spotify).to eq(true)
      expect(new_album.can_be_archived?).to eq(true)
    end
  end
end
