require_relative '20131204201523_create_networks_users_join_table'
class DeleteNetworksUsersJoinTable < ActiveRecord::Migration
  def change
    revert CreateNetworksUsersJoinTable
  end
end
