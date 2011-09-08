class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.string :author
      t.string :commentable_type
      t.integer :commentable_id
      t.text :kind
      t.boolean :approved, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
