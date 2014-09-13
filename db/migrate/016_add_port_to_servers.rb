class AddPortToServers < ActiveRecord::Migration
  def self.up
    add_column :servers, :port, :integer
  end

  def self.down
    remove_column :servers, :port
  end
end
