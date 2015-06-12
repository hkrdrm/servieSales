class CreateServerConfigs < ActiveRecord::Migration
  def self.up
    create_table :server_configs do |t|
      
      t.timestamps
    end
  end

  def self.down
    drop_table :server_configs
  end
end
