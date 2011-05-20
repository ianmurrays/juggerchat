class ChangeTokenToUidInUser < ActiveRecord::Migration
  def self.up
    add_column :users, :uid, :string
    remove_column :users, :token
  end

  def self.down
    add_column :users, :token, :string
    remove_column :users, :uid
  end
end
