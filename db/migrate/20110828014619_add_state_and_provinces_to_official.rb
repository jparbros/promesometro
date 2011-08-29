class AddStateAndProvincesToOfficial < ActiveRecord::Migration
  def self.up
    add_column :officials, :state_id, :integer
    add_column :officials, :province_id, :integer
  end

  def self.down
    remove_column :officials, :province_id
    remove_column :officials, :state_id
  end
end
