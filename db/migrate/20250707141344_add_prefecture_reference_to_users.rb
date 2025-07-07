class AddPrefectureReferenceToUsers < ActiveRecord::Migration[7.2]
  def change
    add_foreign_key :users, :prefectures
    change_column_null :users, :name, false
  end
end
