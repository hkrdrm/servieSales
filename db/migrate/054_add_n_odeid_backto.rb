class AddNOdeidBackto < ActiveRecord::Migration
  def self.up
    add_column :server_nodes, :node_id, :integer
  end

  def self.down
    remove_column :server_nodes, :node_id
  end
end
