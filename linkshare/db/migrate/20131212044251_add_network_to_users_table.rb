class AddNetworkToUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :network_id, :integer
  end
end
