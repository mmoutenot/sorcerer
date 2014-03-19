class TopicSource < ActiveRecord::Base
  belongs_to :source
  belongs_to :topic
  has_many :votes
end
