class AddHeadOfficeAndBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :head_office, :string
    add_column :users, :bio, :text
  end
end
