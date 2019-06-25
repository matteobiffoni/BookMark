class DropBooksUsersTabble < ActiveRecord::Migration[5.2]
  def change
    drop_table :books_users
  end
end
