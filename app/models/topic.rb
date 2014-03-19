class Topic < ActiveRecord::Base
  has_many :topic_sources
  has_many :sources, :through => :topic_sources
end
