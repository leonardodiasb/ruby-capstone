class Item
  attr_accessor :publish_date, :id
  attr_reader :genre, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    time = Time.now
    date_to_compare = Time.new(time.year - 10, time.month, time.day)
    formatted_date = date_to_compare.strftime('%Y-%m-%d')
    @publish_date < formatted_date
  end
end
