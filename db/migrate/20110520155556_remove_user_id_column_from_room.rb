class RemoveUserIdColumnFromRoom < ActiveRecord::Migration
  def self.up
    remove_column :rooms, :user_id
  end

  def self.down
    add_column :rooms, :user_id, :integer
  end
end
