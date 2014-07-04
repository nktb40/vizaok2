class Addcdtovisas < ActiveRecord::Migration
  def change
  		add_column :visas, :visa_cd, :string
  end
end
