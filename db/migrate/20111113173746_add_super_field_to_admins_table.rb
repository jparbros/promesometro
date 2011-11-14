class AddSuperFieldToAdminsTable < ActiveRecord::Migration
  def self.up
    add_column :admins, :super, :boolean
  end

  def self.down
    remove_column :admins, :super
  end
end
