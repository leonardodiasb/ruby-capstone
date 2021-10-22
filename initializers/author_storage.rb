require 'json'

class AuthorStorage
  def load_authors(games)
    File.open('authors.json', 'a')
    if File.read('authors.json') != ''
      authors = JSON.parse(File.read('authors.json'))
      authorscollection = []
      authors.each do |author|
        auth = Author.new(author['first_name'], author['last_name'])
        author['items_ids'].each do |i|
          games.each do |b|
            auth.add_item(b) if i == b.id
          end
        end
        authorscollection << auth
      end
      return authorscollection
    end
    []
  end

  def store_authors(authors)
    authorsjs = []
    authors.each do |e|
      author_items = []
      e.items.each do |i|
        author_items << i.id
      end
      authorsjs << { 'first_name' => e.first_name, 'last_name' => e.last_name, 'items_ids' => author_items }
    end
    File.write('authors.json', JSON.generate(authorsjs))
  end
end
