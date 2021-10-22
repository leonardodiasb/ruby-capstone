require 'json'

class BookStorage
  def load_books
    File.open('books.json', 'a')
    if File.read('books.json') != ''
      books = JSON.parse(File.read('books.json'))
      bookscollection = []
      books.each do |book|
        bk = Book.new(book['publish_date'], publisher: book['publisher'], cover_state: book['cover_state'])
        bk.id = book['id']
        bookscollection << bk
      end
      return bookscollection
    end
    []
  end

  def store_books(books)
    booksjs = []
    books.each do |e|
      booksjs << { 'publisher' => e.publisher, 'cover_state' => e.cover_state, 'publish_date' => e.publish_date,
                   'id' => e.id }
    end
    File.write('books.json', JSON.generate(booksjs))
  end
end
