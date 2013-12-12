class ChangeGroupPrivateNameField < ActiveRecord::Migration
  def change
    rename_column :groups, :private, :solo
  end
end
