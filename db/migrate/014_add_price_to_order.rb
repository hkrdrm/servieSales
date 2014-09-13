class AddPriceToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :price, :integer
  end

  def self.down
    remove_column :orders, :price
  end
end
