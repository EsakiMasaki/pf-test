class AddPublishStatusToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :publish_status, :integer
  end
end
