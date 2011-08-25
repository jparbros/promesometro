class Promise < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :milestones
  belongs_to :official
  
  #
  # Delegates
  #
  delegate :name, :to => :official, :allow_nil => true, :prefix => true
  
  #
  # Nested Attributes
  #
  accepts_nested_attributes_for :milestones
  
end
