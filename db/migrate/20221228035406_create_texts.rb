class CreateTexts < ActiveRecord::Migration[6.1]
  def change
    create_table :texts do |t|
      t.integer :user_id
      t.integer :note_id
      t.text :text

      t.timestamps
    end
  end
end
