class AddLogfileToServerConfigs < ActiveRecord::Migration
  def self.up
    add_column :server_configs, :logfile, :string
  end

  def self.down
    remover_column :server_configs, :logfile
  end
end
