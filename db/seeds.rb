# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topic = Topic.create :name => 'Stalin'
source1 = Source.create :title => 'Stalin\'s Callin',
                        :author => 'Joe Stephenoplis',
                        :isbn => '1929401113'
source2 = Source.create :title => 'My Little Red Diary',
                        :author => 'Joe Stalin',
                        :isbn => '111111111'
topic.sources = [source1, source2]
topic_sources = TopicSource.where :topic => topic, :source => source1
vote = Vote.create :topic_source => topic_sources.first
