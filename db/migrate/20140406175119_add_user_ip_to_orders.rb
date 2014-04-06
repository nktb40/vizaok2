class AddUserIpToOrders < ActiveRecord::Migration
  def change
  		add_column :orders, :user_ip, :string
  		add_column :orders, :visa_country, :string
  		add_column :orders, :visa_type, :string
  		add_column :orders, :skype, :string
  		
  		add_column :questions, :user_ip, :string
  		add_column :questions, :address, :text
  		add_column :questions, :visa_country, :string
  		add_column :questions, :skype, :string
  end
end
