class TopicSource < ActiveRecord::Base
  belongs_to :source
  belongs_to :topic
  has_many :votes

  def net_votes
    @net_votes ||= Vote.where(:topic_source => self).count
  end
end
