class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :authors
      t.string :isbn
      t.string :image_url
      t.string :google_external_id

      t.timestamps
    end
  end
end
