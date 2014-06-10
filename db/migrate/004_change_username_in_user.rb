class ChangeUsernameInUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      change_column t.string :username, :unique => true
    end
  end

  def self.down
    change_column :users do |t|
      t.string :username, :unique => false
    end
  end
end
