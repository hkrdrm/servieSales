class CreateTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.integer :teamId
      t.integer :memberId
      t.string :role
      t.timestamps
    end
  end

  def self.down
    drop_table :team_members
  end
end
