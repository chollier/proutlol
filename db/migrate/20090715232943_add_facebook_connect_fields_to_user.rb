class AddFacebookConnectFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facebook_uid, :bigint
  end

  def self.down
    remove_column :users, :facebook_uid
  end
end
