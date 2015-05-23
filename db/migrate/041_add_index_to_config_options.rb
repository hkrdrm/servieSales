class AddIndexToConfigOptions < ActiveRecord::Migration
  def self.up
    add_index :config_options, :option, :unique => true
  end

  def self.down
    remove_index :config_options, :option
  end
end
