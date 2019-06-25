class AddPreferredBooksToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :preferred_books, foreign_key: true
  end
end
