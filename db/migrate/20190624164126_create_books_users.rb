class CreateBooksUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :books_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true
    end
  end
end
