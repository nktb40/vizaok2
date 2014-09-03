class AddColumnToVisa < ActiveRecord::Migration
  def change
  		add_column :visas, :order, :integer
  end
end
