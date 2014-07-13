class CreatePurposes < ActiveRecord::Migration
  def change
    create_table :purposes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
