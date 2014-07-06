class CreateSubtypes < ActiveRecord::Migration
  def change
    create_table :subtypes do |t|
      t.integer :visatype_id
      t.string :name
      t.string :subtype_cd

      t.timestamps
    end
  end
end
