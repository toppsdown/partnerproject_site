class CreateNetworksUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :networks_users, :id => false do |t|
      t.integer :network_id
      t.integer :user_id
    end
  end
end
