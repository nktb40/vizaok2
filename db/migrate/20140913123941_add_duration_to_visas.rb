class AddDurationToVisas < ActiveRecord::Migration
  def change
  		add_column :visas, :duration, :string
  end
end
