class CreateJoinForUsersAndBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books_users, id: false do |t|
      t.belongs_to :reader, index: true
      t.belongs_to :preferred_books, index: true
    end
  end
end
