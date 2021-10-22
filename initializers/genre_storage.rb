require 'json'

class GenreStorage
  def load_genres(albums)
    File.open('genres.json', 'a')
    if File.read('genres.json') != ''
      genres = JSON.parse(File.read('genres.json'))
      genrescollection = []
      genres.each do |genre|
        gen = Genre.new(genre['name'])
        genre['items_ids'].each do |i|
          albums.each do |b|
            gen.add_item(b) if i == b.id
          end
        end
        genrescollection << gen
      end
      return genrescollection
    end
    []
  end

  def store_genres(genres)
    genresjs = []
    genres.each do |e|
      genre_items = []
      e.items.each do |i|
        genre_items << i.id
      end
      genresjs << { 'name' => e.name, 'items_ids' => genre_items }
    end
    File.write('genres.json', JSON.generate(genresjs))
  end
end
