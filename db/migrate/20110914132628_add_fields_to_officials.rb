class AddFieldsToOfficials < ActiveRecord::Migration
  def self.up
    remove_column :officials, :twitter  
    remove_column :officials, :facebook
    add_column :officials, :dni, :string
    add_column :officials, :birthday, :date
    add_column :officials, :supplementary_data, :string
    add_column :officials, :resume, :string
  end

  def self.down
    remove_column :officials, :resume
    remove_column :officials, :supplementary_data
    remove_column :officials, :birthday
    remove_column :officials, :dni
    add_column :officials, :facebook, :string
    add_column :officials, :twitter, :string
  end
end