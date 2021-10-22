require_relative 'item'

class Book < Item
  def initialize(*args, publisher:, cover_state:)
    super(*args)
    @publisher = publisher
    @cover_state = cover_state
  end
  attr_accessor :publisher, :cover_state

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
