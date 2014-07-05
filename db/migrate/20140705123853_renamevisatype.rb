class Renamevisatype < ActiveRecord::Migration
  def change
  		rename_column :visas, :type_id, :visatype_id
  end
end
