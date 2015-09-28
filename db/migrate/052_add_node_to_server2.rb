class AddNodeToServer2 < ActiveRecord::Migration
  def self.up
    add_column :servers, :node_id, :integer
    remove_column :server_nodes, :node_id, :integer
  end

  def self.down
    remove_column :servers, :node_id, :integer
    add_column :server_nodes, :node_id, :integer
  end
end
