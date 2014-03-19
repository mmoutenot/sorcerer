class Source < ActiveRecord::Base
  has_many :topic_sources
  has_many :topics, :through => :topic_sources
end
