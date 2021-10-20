require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify: true)
    super()
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @publish_date > 10 && @on_spotify = true
  end
end
