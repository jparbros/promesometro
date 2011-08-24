class CreateOfficials < ActiveRecord::Migration
  def self.up
    create_table :officials do |t|
      t.string :name
      t.string :avatar
      t.string :twitter
      t.string :facebook
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :officials
  end
end
