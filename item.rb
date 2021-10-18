class Item
  def initialize(genre, author, sources, label, date)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @sources = sources
    @label = label
    @publish_date = date
    @archived = false
  end

  attr_reader :id, :archived
  attr_accessor :genre, :author, :sources, :label, :publish_date
  
  def can_be_archived?
    if @publish_date > 10
      return true
    else 
      return false
    end
  end

  def move_to_archive
    if can_be_archived?
      @archived = true
    end
  end

  private :can_be_archived?
  
end