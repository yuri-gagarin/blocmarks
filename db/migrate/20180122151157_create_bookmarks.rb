class CreateBookmarks < ActiveRecord::Migration[5.1]
  def self.up
    create_table :bookmarks do |t|

      t.string "url"
      t.integer "topic_id"
      t.integer "user_id"
      t.timestamps

    end
  end

  def self.down
    drop_table :bookmarks
  end

end
