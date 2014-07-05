class CreateAddinfos < ActiveRecord::Migration
  def change
    create_table :addinfos do |t|
      t.integer :visa_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
