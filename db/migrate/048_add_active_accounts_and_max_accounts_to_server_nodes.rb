class AddActiveAccountsAndMaxAccountsToServerNodes < ActiveRecord::Migration
  def self.up
    add_column :server_nodes, :active_accounts, :integer
    add_column :server_nodes, :max_accounts, :integer
  end

  def self.down
    add_column :server_nodes, :active_accounts
    add_column :server_nodes, :max_accounts
  end
end
