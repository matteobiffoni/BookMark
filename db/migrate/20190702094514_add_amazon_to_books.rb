class AddAmazonToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :amazon, :string
  end
end
