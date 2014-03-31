class CreateTopicSources < ActiveRecord::Migration
  def change
    create_table :topic_sources do |t|
      t.integer :topic_id
      t.integer :source_id
      t.integer :user_id

      t.timestamps
    end
  end
end
