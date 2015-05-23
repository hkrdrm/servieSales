class CreateConfigOptions < ActiveRecord::Migration
  def self.up
    create_table :config_options do |t|
      t.string :option
      t.string :possible_settings
      t.timestamps
    end
  end

  def self.down
    drop_table :config_options
  end
end
