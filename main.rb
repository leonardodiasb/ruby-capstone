require_relative 'list_books'
require_relative 'list_labels'
require_relative 'create_book'

class App
  def initialize
    @books = []
    @labels = []
  end

  def run
    message = [' ', 'This is the Catalog of my things App', ' ', 'Please choose an option by entering a number:',
               '1 - List all books', '2 - List all labels', '3 - Create a book', '4 - Exit']
    message.each { |e| puts e }
    option = gets.chomp
    case option
    when '1'
      ListBooks.new.list_books(@books)
      run
    when '2'
      ListLabels.new.list_labels(@labels)
      run
    when '3'
      CreateBook.new.create_book(@books, @labels)
      run
    when '4'
      puts 'Thank you for using this app'
    else
      puts 'This option is not available'
      run
    end
  end
end

def main
  app = App.new
  app.run
end

main
