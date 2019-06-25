class AddWriterRefToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :writer, foreign_key: true
  end
end
