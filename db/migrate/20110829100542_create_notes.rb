class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.text :note
      t.string :note_by
      t.integer :noteable_id
      t.string :noteable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
