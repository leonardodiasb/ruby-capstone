require_relative '../game'
require_relative '../author'

describe Game do
  context 'when use add_item method' do
    it 'items array length increase by one, multiplayer shows true, and last_played_at shows 2019-12-12' do
      multiplayer = 'true'
      last_played_at = '2021-04-09'
      publish_date = '2005-02-02'
      author_first_name = 'Richie'
      author_last_name = 'Rod'
      new_game = Game.new(publish_date, multiplayer, last_played_at)
      new_game_author = Author.new(author_first_name, author_last_name)
      new_game_author.add_item(new_game)

      expect(new_game_author.items.length).to eq(1)
      expect(new_game.multiplayer).to eq('true')
      expect(new_game.last_played_at).to eq('2021-04-09')
    end
  end
end
