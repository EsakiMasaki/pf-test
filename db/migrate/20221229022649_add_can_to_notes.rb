class AddCanToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :can, :text
  end
end
