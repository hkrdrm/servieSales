class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :userId
      t.string :subject
      t.string :body
      t.string :from
      t.boolean :notify
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
