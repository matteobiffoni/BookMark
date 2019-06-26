class RemovePublishedFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :published_id
  end
end
