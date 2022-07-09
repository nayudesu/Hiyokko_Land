class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :member_id, null: false
      t.integer :post_id, null: false
      t.text :comment

      t.timestamps
    end
  end
end