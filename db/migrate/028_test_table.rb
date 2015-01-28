class TestTable < ActiveRecord::Migration
  def self.up
    create_table :testTable do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :testTable
  end
end
