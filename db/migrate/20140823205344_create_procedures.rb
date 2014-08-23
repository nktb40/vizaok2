class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.integer :visa_id
      t.string :step
      t.text :description

      t.timestamps
    end
  end
end
