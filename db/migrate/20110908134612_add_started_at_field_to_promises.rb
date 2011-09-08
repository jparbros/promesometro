class AddStartedAtFieldToPromises < ActiveRecord::Migration
  def self.up
    add_column :promises, :started_at, :timestamp
    add_column :promises, :ended_at, :timestamp
  end

  def self.down
    remove_column :promises, :started_at
    remove_column :promises, :ended_at
  end
end
