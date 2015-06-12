class AddPasswordToServerConfigs < ActiveRecord::Migration
  def self.up
    add_column :server_configs, :password, :string
  end

  def self.down
    remove_column :server_configs, :password
  end
end
