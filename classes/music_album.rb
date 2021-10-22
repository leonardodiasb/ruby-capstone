class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(publish_date, title:, on_spotify: true)
    super(publish_date)
    @on_spotify = on_spotify
    @title = title
  end

  private

  def can_be_archived?
    @publish_date > 10 && @on_spotify = true
  end
end
