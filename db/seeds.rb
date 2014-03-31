
user = User.create({
  :first_name => 'Joseph',
  :last_name => 'Stalin',
  :email => 'admin@sorcerer.com',
  :password => 'motherrussia',
})

topic = user.topics.create(:name => 'Stalin')

GoogleBooks.search(topic.name, { :projection => 'lite', :count => 3 }).each do |b|
  s = topic.sources.create({
    :title => b.title,
    :authors => b.authors,
    :google_external_id => b.id,
    :image_hi_url => b.image_link(:zoom => 2, :curl => false),
    :image_lo_url => b.image_link(:zoom => 5, :curl => false),
    :isbn => b.isbn,
  })
  user.topic_sources << TopicSource.where(:topic => topic, :source => s)
end

