class CreateLikes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :likes do |t|

      t.integer :user_id
      t.integer :bookmark_id
      t.timestamps
    end
    add_index :likes, :user_id, name: "user_id_index_likes"
    add_index :likes, :bookmark_id, name: "bookmark_index_likes"
  end

  def self.down
    drop_table :likes
  end
end
