require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  context 'When testing Label class' do
    label1 = Label.new(title: 'Leon', color: 'red')
    book1 = Book.new(0, publisher: 'Leonard', cover_state: 'good')
    it 'Should return the title and color of the label' do
      expect(label1.title).to eq 'Leon'
      expect(label1.color).to eq 'red'
    end
    it 'Should return the book item in the items array after add the book to the label' do
      label1.add_item(book1)
      expect(label1.items).to include(book1)
    end
  end
end
