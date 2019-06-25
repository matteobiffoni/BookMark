class AddReaderToBooks < ActiveRecord::Migration[5.2]
  def change
    add_reference :books, :reader, foreign_key: true
  end
end
