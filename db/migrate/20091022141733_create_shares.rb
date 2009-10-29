class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.integer :type
      t.integer :creator_id
      t.integer :post_id
      t.timestamps
    end
  end

  def self.down
    drop_table :shares
  end
end
