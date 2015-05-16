class CreateUserConfigs < ActiveRecord::Migration
  def self.up
    create_table :user_configs do |t|
      t.string :option
      t.string :setting
      t.timestamps
    end
  end

  def self.down
    drop_table :user_configs
  end
end
