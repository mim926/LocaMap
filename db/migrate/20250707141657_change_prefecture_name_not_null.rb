class ChangePrefectureNameNotNull < ActiveRecord::Migration[7.2]
  def change
    change_column_null :prefectures, :name, false
  end
end
