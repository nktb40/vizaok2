class Addcolumntovisatypes < ActiveRecord::Migration
  def change
  		add_column :visatypes, :migration, :string
  		remove_column :visatypes, :subtype
  end
end
