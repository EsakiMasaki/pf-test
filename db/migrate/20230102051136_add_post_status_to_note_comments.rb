class AddPostStatusToNoteComments < ActiveRecord::Migration[6.1]
  def change
    add_column :note_comments, :post_status, :integer
  end
end
