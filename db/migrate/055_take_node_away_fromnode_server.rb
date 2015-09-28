class TakeNodeAwayFromnodeServer < ActiveRecord::Migration
  def self.up
    remove_column :server_nodes, :node_id, :integer
  end

  def self.down
    add_column :server_nodes, :node_id
  end
end
