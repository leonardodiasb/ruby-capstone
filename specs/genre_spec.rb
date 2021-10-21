require_relative './genre'
require_relative './item'

describe Genre do
  context 'Check for music genres' do
    it 'can access the genres of music and check item array length' do
      item = Item.new('action', 'Lee Yin', 'sources', 'label', 8)
      genre = Genre.new('Comedy')
      item.genre = genre
      genre.add_item(item)
      expect(genre.items.empty?).to eq(false)
      expect(item.genre.name == 'Comedy').to be(true)
    end
  end
end
