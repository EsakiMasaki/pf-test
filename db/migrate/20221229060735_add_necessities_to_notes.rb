class AddNecessitiesToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :necessities, :text
  end
end
