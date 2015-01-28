class RemoveSlotsColumnFromProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.remove :slots
    end
  end

  def self.down
    change_table :products do |t|
      t.integer :slots
    end
  end
end
