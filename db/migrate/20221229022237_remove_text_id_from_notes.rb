class RemoveTextIdFromNotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :notes, :text_id, :integer
  end
end
