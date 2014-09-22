class AddCatalogIdVisas < ActiveRecord::Migration
  def change
      add_column :catalogs, :catalog_cd, :string
  		add_column :visas, :catalog_id, :integer
  		add_index :catalogs, :slug
  end
end
