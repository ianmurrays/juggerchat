class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :token
      t.datetime :last_seen

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
