class AddColumnToVisa < ActiveRecord::Migration
  def change
  	   add_column :visas, :term1, :string
  		add_column :visas, :term2, :string
		add_column :visas, :tax1, :string
		add_column :visas, :tax2, :string
  end
end
