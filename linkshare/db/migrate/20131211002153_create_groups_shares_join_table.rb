class CreateGroupsSharesJoinTable < ActiveRecord::Migration
  def change
    create_table :groups_shares, :id => false do |t|
      t.integer :group_id
      t.integer :share_id
    end
  end
end
