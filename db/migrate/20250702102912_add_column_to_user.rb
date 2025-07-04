class AddColumnToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :prefecture_id, :integer
    add_column :users, :local_history, :string
    add_column :users, :icon_image, :string
  end
end
