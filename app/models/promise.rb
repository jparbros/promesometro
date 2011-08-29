class Promise < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :milestones
  belongs_to :official
  has_and_belongs_to_many :topics
  
  #
  # Delegates
  #
  delegate :name, :to => :official, :allow_nil => true, :prefix => true
  delegate :avatar, :to => :official, :allow_nil => true, :prefix => true
  
  #
  # Nested Attributes
  #
  accepts_nested_attributes_for :milestones
  
  #
  # Validates
  #
  validates :title, :presence => true
  validates :description, :presence => true
  
end
