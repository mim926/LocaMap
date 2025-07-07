class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :address
      t.text :description, null: false
      t.string :image
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true, null: false
      t.timestamps
    end
  end
end
