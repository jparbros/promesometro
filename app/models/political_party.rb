class PoliticalParty < ActiveRecord::Base
  #
  # CarrierWave
  #
  mount_uploader :logo, LogoUploader
end
