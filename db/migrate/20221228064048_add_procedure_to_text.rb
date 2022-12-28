class AddProcedureToText < ActiveRecord::Migration[6.1]
  def change
    add_column :texts, :procedure, :string
  end
end
