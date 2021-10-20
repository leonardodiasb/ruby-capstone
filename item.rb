class Item
  def initialize(date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @sources = sources
    @label = label
    @publish_date = date
    @archived = move_to_archive
  end

  attr_reader :id, :archived
  attr_accessor :genre, :author, :sources, :label, :publish_date

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?
end
