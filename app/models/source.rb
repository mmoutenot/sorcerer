class Source < ActiveRecord::Base
  has_many :topic_sources
  has_many :topics, :through => :topic_sources

  def self.new_from_google_books(google_external_id)
    book = GoogleBooks.search("id:#{google_external_id}").first
    return nil unless book

    Source.new({
      :title => book.title,
      :authors => book.authors,
      :google_external_id => book.id,
      :image_hi_url => book.image_link(:zoom => 2, :curl => false),
      :image_lo_url => book.image_link(:zoom => 5, :curl => false),
      :isbn => book.isbn,
    })
  end
end
