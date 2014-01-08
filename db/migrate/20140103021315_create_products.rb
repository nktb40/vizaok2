class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model
      t.string :collection
      t.text :description
      t.integer :price
      t.string :color
      t.string :wrist_band
      t.string :technology
      t.text :img_url

      t.timestamps
    end
  end
end
