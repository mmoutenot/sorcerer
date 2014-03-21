class Topic < ActiveRecord::Base
  has_many :topic_sources
  has_many :sources, :through => :topic_sources

  def sorted_topic_sources
    self.topic_sources.includes(:source)
          .sort_by(&:net_votes).reverse
  end
end
