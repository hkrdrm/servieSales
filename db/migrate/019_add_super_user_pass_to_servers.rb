class AddSuperUserPassToServers < ActiveRecord::Migration
  def self.up
    add_column :servers, :superUserPassword, :string
  end

  def self.down
    remove_column :servers, :superUserPassword
  end
end
