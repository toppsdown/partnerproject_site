class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :user_id
      t.integer :link_id
      t.integer :network_id
      t.integer :group_id
      t.integer :reads
      t.integer :votes

      t.timestamps
    end
  end
end
