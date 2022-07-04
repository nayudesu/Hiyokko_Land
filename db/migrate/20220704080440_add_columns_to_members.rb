class AddColumnsToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :nickname, :string, null: false
    add_column :members, :introduction, :string, null: false
    add_column :members, :is_deleted, :boolean, default: false, null: false
  end
end
