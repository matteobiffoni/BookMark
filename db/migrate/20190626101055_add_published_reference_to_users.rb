class AddPublishedReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :published, index: true
  end
end
