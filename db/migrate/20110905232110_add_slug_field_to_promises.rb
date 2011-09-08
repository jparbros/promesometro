class AddSlugFieldToPromises < ActiveRecord::Migration
  def self.up
    add_column :promises, :slug, :text
  end

  def self.down
    remove_column :promises, :slug
  end
end
