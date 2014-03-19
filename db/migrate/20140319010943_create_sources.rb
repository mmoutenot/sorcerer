class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :author
      t.string :isbn

      t.timestamps
    end
  end
end
