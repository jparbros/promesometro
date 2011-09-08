class AddStartedAtFieldToMilestones < ActiveRecord::Migration
  def self.up
    add_column :milestones, :started_at, :timestamp
    add_column :milestones, :ended_at, :timestamp
  end

  def self.down
    remove_column :milestones, :started_at
    remove_column :milestones, :ended_at
  end
end
