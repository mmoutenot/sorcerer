class Vote < ActiveRecord::Base
  belongs_to :topic_source
  belongs_to :vote
end
