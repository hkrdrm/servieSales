class AddActiveAccountsAndMaxAccountsToServerNodes < ActiveRecord::Migration
  def self.up
    add_column :server_nodes, :active_accounts, :integer
    add_column :server_nodes, :max_accounts, :integer
  end

  def self.down
    remove_column :server_nodes, :active_accounts
    remove_column :server_nodes, :max_accounts
  end
end
