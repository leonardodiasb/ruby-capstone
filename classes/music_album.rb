class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(genre, author, sources, label, date, on_spotify: true)
    super(genre, author, sources, label, date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @publish_date > 10 && @on_spotify = true
  end
end
