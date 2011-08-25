class CreatePromises < ActiveRecord::Migration
  def self.up
    create_table :promises do |t|
      t.string :title
      t.text :description
      t.integer :official_id

      t.timestamps
    end
  end

  def self.down
    drop_table :promises
  end
end
