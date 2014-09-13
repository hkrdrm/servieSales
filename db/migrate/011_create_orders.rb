class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :userId
      t.integer :subscriptionId
      t.string :paymentMethod
      t.boolean :paid
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
