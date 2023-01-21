class CreateReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :references do |t|
      t.string :name
      t.string :url
      t.integer :note_id

      t.timestamps
    end
  end
end
