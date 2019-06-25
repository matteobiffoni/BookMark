class RemoveWriterRefFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :writer
  end
end
