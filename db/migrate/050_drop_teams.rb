class DropTeams < ActiveRecord::Migration
  def self.up
    drop_table :teams
    drop_table :team_members
  end

  def self.down
  end
end
