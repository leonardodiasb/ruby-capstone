class Label
  def initialize(title:, color:)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  attr_reader :id, :items
  attr_accessor :title, :color

  def add_item(item)
    @items << item
    item.label = self
  end
end
