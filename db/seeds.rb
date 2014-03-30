# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topic = Topic.create :name => 'Stalin'

books = GoogleBooks.search(topic.name, { :projection => 'lite', :count => 3 }).map do |b|
  {
    :title => b.title,
    :isbn => b.isbn,
    :g_id => b.id,
    :authors => b.authors,
    :image => b.image_link(:zoom => 2, :curl => false),
  }
end

books.each do |b|
  s = Source.create({
    :title => b[:title],
    :authors => b[:authors],
    :google_external_id => b[:g_id],
    :image_url => b[:image],
    :isbn => b[:isbn],
  })
  topic.sources << s
end

