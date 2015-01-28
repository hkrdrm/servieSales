class RemoveCartAndItems < ActiveRecord::Migration
  def self.up
    drop_table :cart_items
    drop_table :carts
  end

  def self.down
    create_table :cart_items do |t|

      t.timestamps
    end
    create_table :cart do |t|

      t.timestamps
    end
  end
end
