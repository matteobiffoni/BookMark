class AddRoleStrToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_str, :string
  end
end
