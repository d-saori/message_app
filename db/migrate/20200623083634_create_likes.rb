class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, index: true
      t.integer :message_id, null: false, index: true

      t.timestamps
    end
    # [:user_id, :message_id], unique: true→user_idとmessage_idがunique(「いいね!」が重複しないようにしない)バリデーション
    add_index :likes, [:user_id, :message_id], unique: true
  end
end
