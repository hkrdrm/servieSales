class AddIpToServerNode < ActiveRecord::Migration
  def self.up
    add_column :server_nodes, :ip, :string
  end

  def self.down
    remove_column :server_nodes, :ip
  end
end
