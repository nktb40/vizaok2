class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :country_id

      t.timestamps
    end
  end
end
