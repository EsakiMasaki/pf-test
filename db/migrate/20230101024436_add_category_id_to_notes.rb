class AddCategoryIdToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :category_id, :integer
  end
end
