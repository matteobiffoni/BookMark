class RemovePreferredBooksFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :preferred_books
  end
end
