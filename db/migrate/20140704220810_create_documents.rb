class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
    	t.integer :visa_id
		t.string :name
      t.text :description
      t.timestamps
    end
  end
end
