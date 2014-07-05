class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
    	t.integer :visa_id
      t.string :name
      t.text :description
      t.float :price
      t.string :currency

      t.timestamps
    end
  end
end
