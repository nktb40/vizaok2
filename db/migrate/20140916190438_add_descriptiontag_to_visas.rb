class AddDescriptiontagToVisas < ActiveRecord::Migration
  def change
  		add_column :visas, :description_tag, :text
  		add_column :visas, :title_tag, :text
  end
end
