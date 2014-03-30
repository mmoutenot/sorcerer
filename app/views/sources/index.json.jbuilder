json.array!(@sources) do |source|
  json.extract! source, :id, :title, :authors, :isbn, :image_url
  json.url source_url(source, format: :json)
end
