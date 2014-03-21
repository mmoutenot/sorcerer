class TopicSource < ActiveRecord::Base
  belongs_to :source
  belongs_to :topic
  has_many :votes

  def net_votes
    @net_votes ||= votes.count
  end
end
