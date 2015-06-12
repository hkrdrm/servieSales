class AddSidToServerConfigs < ActiveRecord::Migration
  def self.up
    add_column :server_configs, :server_id, :integer
  end

  def self.down
    remove_column :server_configs, :server_id
  end
end
