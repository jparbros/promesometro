class Official < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :promises
  belongs_to :state
  belongs_to :province
  belongs_to :political_party
  
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
  
  #
  # Delegates
  #
  delegate :name, :to => :political_party, :allow_nil => true, :prefix => true
  
  def position_name
    POSITIONS[position]
  end
  
  def photo(type = :thumb)
    if avatar.url.nil?
      "/images/user_#{type.to_s}.png"
    else
      avatar.url(type)
    end
  end
end
