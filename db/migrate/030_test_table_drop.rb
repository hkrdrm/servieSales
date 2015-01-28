class TestTableDrop < ActiveRecord::Migration
  def self.up
    drop_table :testTable
  end

  def self.down
    create_table :testTable do |t|
      t.string :name
    end
  end
end
