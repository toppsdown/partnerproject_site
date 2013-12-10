class AddImageUrlToLink < ActiveRecord::Migration
  def change
    add_column :links, :img_url, :string
  end
end
