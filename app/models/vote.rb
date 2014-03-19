class Vote < ActiveRecord::Base
  belongs_to :topic_source
end
