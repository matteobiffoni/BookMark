class ChangeYearToBeStringInBooks < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :year, :string
  end
  def down
    change_column :books, :year, :date
  end
end
