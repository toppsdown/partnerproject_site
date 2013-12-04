class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.integer :network_id
    	t.string :name
    	t.text :description
    end
  end
end
