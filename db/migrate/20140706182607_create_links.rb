class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :visa_id
      t.string :name
      t.text :link

      t.timestamps
    end
  end
end
