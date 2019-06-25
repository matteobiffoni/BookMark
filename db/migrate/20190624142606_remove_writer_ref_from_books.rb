class RemoveWriterRefFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :books, :user_id
  end
end
