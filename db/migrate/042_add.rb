class Add < ActiveRecord::Migration
  def self.up
    add_column :config_options, :user_editable, :boolean
  end

  def self.down
    remove_column :config_options, :user_editable
  end
end
