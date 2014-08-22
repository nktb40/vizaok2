class AddCountryToOrder < ActiveRecord::Migration
  def change
  		add_column :orders, :user_country, :string
  		add_column :orders, :user_city, :string
  end
end
