require_relative '../classes/game'
require_relative '../classes/author'

describe Author do
  context 'when use Create Author method' do
    it 'Authors name says Richie and lastname shows Rod, also authors length shows 1' do
      multiplayer = 'yes'
      last_played_at = '2012-11-11'
      publish_date = '2002-01-12'
      author_first_name = 'Richie'
      author_last_name = 'Rod'
      new_game = Game.new(publish_date, multiplayer, last_played_at)
      new_game_author = Author.new(author_first_name, author_last_name)
      new_game_author.add_item(new_game)

      expect(new_game_author.items.length).to eq(1)
      expect(new_game_author.first_name).to eq('Richie')
      expect(new_game_author.last_name).to eq('Rod')
    end
  end
end
