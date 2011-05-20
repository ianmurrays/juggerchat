class AddPictureUrlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :picture_url, :string
  end

  def self.down
    remove_column :users, :picture_url
  end
end
