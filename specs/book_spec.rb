require_relative '../classes/book'

describe Book do
  context 'When testing book class' do
    book1 = Book.new(0, publisher: 'Leon', cover_state: 'good')
    it 'Should return the publisher Leon when we call the publisher' do
      expect(book1.publisher).to eq 'Leon'
    end
    it 'Should return the cover state good when we call the cover_state' do
      expect(book1.cover_state).to eq 'good'
    end
  end
end
