class CreateTopics < ActiveRecord::Migration[5.1]
  def self.up
    create_table :topics do |t|

      t.string "title"
      t.integer "user_id"
      t.timestamps
    end
    add_index "topics", ["user_id"], name: "index_topics_on_user_id"
  end

  def self.down
    drop_table :topics
  end
end
