class CreateServerNodes < ActiveRecord::Migration
  def self.up
    create_table :server_nodes do |t|
      t.string :city
      t.string :state
      t.integer :ram
      t.timestamps
    end
  end

  def self.down
    drop_table :server_nodes
  end
end
