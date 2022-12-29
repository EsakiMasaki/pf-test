class AddConcludeToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :conclude, :text
  end
end
