class AddIndexToBookmarks < ActiveRecord::Migration[5.1]
  def self.up
    add_index "bookmarks", ["topic_id"], name: "index_bookmarks_on_topic_id"
    add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id"
  end

  def self.down
    remove_index "bookmarks", column: ["topic_id", "user_id"]
  end
end
