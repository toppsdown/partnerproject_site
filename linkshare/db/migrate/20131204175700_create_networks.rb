class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :name
      t.text :description
      t.string :email_domain

      t.timestamps
    end
  end
end
