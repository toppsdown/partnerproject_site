class GroupDefaultNotPrivate < ActiveRecord::Migration
  def change
    change_column :groups, :private, :boolean, :default => false
  end
end
