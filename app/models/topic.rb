class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :topic_sources
  has_many :sources, :through => :topic_sources

  def sorted_topic_sources
    self.topic_sources.includes(:source)
          .sort_by(&:net_votes).reverse
  end
end
