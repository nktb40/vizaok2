class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.string :name
      t.text :description
      t.text :title_tag
      t.text :description_tag
      t.string :slug

      t.timestamps
    end
  end
end
