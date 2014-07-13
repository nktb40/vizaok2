class Addcolumntovisas < ActiveRecord::Migration
  def change
  	add_column :visas, :shortdesc, :string
  	add_column :purposes, :purpose_cd, :string
  end
end
