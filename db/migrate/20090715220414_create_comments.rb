class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :url
      t.text :content
      t.integer :post_id
      t.integer :user_id
      t.string :ip
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
