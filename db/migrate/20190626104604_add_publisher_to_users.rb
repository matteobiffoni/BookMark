class AddPublisherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :publisher, index: true
  end
end
