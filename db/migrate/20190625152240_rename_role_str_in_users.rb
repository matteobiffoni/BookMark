class RenameRoleStrInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :role_str, :user_role
  end
end
