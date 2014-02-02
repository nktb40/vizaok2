class AddPhoneToQuestion < ActiveRecord::Migration
  def change
  	add_column :questions, :phone, :string 
  end
end
