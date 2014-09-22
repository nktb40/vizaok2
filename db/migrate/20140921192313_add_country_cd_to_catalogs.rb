class AddCountryCdToCatalogs < ActiveRecord::Migration
  def change
  		add_column :catalogs, :country_id, :integer
  end
end
