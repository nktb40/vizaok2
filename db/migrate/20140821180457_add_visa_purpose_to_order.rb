class AddVisaPurposeToOrder < ActiveRecord::Migration
  def change
  		add_column :orders, :visa_purpose, :string
  end
end
