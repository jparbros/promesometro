class PoliticalParty < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :officials
  
  #
  # CarrierWave
  #
  mount_uploader :logo, LogoUploader
end
