class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
