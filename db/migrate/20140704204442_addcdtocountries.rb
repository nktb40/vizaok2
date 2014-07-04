class Addcdtocountries < ActiveRecord::Migration
  def change
  		add_column :countries, :country_cd, :string
  		add_column :visatypes, :type_cd, :string
  		add_column :visas, :country_cd, :string
  		add_column :visas, :type_cd, :string
  		
		remove_column :visas, :type
		add_column :visas, :type_id, :integer
  end
end
