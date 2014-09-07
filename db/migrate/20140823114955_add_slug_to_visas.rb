class AddSlugToVisas < ActiveRecord::Migration
  def change
    add_column :visas, :slug, :string
	 add_column :visas, :order, :integer
  end
end
