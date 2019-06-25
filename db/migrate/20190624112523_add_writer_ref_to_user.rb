class AddWriterRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :writer, foreign_key: true
  end
end
