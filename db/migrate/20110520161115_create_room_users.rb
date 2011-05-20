class CreateRoomUsers < ActiveRecord::Migration
  def self.up
    create_table :room_users do |t|
      t.integer :room_id
      t.integer :user_id
      t.boolean :creator, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :room_users
  end
end
