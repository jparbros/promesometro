class Official < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :promises
  belongs_to :state
  belongs_to :province
  
  #
  # CarrierWave
  #
  mount_uploader :avatar, AvatarUploader
  
  #
  # Constants
  #
  POSITIONS = ['Alcalde','Presidente Regional','Presidente']
  
  #
  # Validates
  #
  validates :name, :presence => true
  #validates :avatar, :presence => true
  validates :position, :presence => true
  
  #
  # Scopes
  #
  
  scope :mayors, where('position', 0)
  scope :governors, where('position', 1)
  scope :president, where('position', 2)
  
  def position_name
    POSITIONS[position]
  end
end
