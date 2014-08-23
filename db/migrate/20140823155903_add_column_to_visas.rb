class AddColumnToVisas < ActiveRecord::Migration
  def change
    add_column :visas, :translit, :string
  end
end
