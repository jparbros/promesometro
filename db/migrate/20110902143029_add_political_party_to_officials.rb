class AddPoliticalPartyToOfficials < ActiveRecord::Migration
  def self.up
    add_column :officials, :political_party_id, :integer
  end

  def self.down
    remove_column :officials, :political_party_id
  end
end
