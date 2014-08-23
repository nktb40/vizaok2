class AddSlugToVisas < ActiveRecord::Migration
  def change
    add_column :visas, :slug, :string
  end
end
