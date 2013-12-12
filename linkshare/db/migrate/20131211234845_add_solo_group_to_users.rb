class AddSoloGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :my_group, :integer
  end
end
