class AddColumnToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :name2, :string
  end
end
