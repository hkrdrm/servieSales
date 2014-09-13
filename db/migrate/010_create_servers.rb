class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.integer :userId
      t.string :name
      t.string :ip
      t.string :software
      t.integer :slots
      t.string :password
      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
