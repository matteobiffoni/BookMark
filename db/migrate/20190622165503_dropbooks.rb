class Dropbooks < ActiveRecord::Migration[5.2]
  def change
    drop_table :books
  end
end
