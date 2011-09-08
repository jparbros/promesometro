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
  
  def start
    self.started_at = Time.now
    self.save
  end
  
  def started?
    !self.started_at.blank?
  end
  
  def finish
    self.ended_at = Time.now if ready_to_finish?
    self.save
  end
  
  def finished?
    !self.ended_at.blank?
  end
  
  def ready_to_finish?
    self.milestones.where(:ended_at => nil).count == 1
  end
end
