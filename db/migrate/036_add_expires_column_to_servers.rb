class AddExpiresColumnToServers < ActiveRecord::Migration
  def self.up
    add_column :servers, :expires, :datetime
  end

  def self.down
    remove_column :servers, :expires
  end
end
