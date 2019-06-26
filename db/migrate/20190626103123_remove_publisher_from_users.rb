class RemovePublisherFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :publisher_id
  end
end
