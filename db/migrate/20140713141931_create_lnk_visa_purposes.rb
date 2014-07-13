class CreateLnkVisaPurposes < ActiveRecord::Migration
  def change
    create_table :lnk_visa_purposes do |t|
      t.integer :visa_id
      t.integer :purpose_id

      t.timestamps
    end
  end
end
