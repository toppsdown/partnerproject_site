require_relative '20131212034420_recreate_networks_users_join_table'
class RedestroyNetworkUsersTable < ActiveRecord::Migration
  def change
    revert RecreateNetworksUsersJoinTable
  end
end
