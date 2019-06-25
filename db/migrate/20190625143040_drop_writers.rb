class DropWriters < ActiveRecord::Migration[5.2]
  def change
    drop_table :writers
  end
end
