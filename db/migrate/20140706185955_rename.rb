class Rename < ActiveRecord::Migration
  def change
  		rename_column :visas, :visatype_id, :subtype_id
  end
end
