class Promise < ActiveRecord::Base
  
  #
  # Associations
  #
  has_many :milestones
  belongs_to :official
  has_and_belongs_to_many :topics
  has_many :comments, :as => :commentable
  
  #
  # Delegates
  #
  delegate :name, :to => :official, :allow_nil => true, :prefix => true
  delegate :avatar, :to => :official, :allow_nil => true, :prefix => true
  delegate :avatar_url, :to => :official, :allow_nil => true, :prefix => true
  delegate :political_party_name, :to => :official, :allow_nil => true, :prefix => true
  delegate :position_name, :to => :official, :allow_nil => true, :prefix => true
  delegate :citizens_approved, :to => :comments, :allow_nil => true, :prefix => true
  delegate :government, :to => :comments, :allow_nil => true, :prefix => true
  delegate :state_name, :to => :official, :allow_nil => true, :prefix => true
  delegate :promises, :to => :official, :allow_nil => true, :prefix => true
  
  
  #
  # Nested Attributes
  #
  accepts_nested_attributes_for :milestones
  
  #
  # Validates
  #
  validates :title, :presence => true
  validates :description, :presence => true
  
  #
  # Callbacks
  #
  before_save :set_slug
  
  #
  # Pagination
  #
  paginates_per 10
  
  #
  # Scopes
  #
  default_scope order('promises.created_at desc')
  scope :topics_contains, lambda {|topic| includes('topics').where('topics.name like ?',"%#{topic}%") }
  scope :dias_progreso_contains, lambda {|days| where('started_at > ?', days.to_i.day.ago.strftime('%m/%d/%y')) }
  
  
  #
  # Search Methods
  #
  search_methods :topics_contains, :dias_progreso_contains
  
  def start
    self.started_at = Time.now
    self.save
  end
  
  def started?
    !self.started_at.blank? and self.ended_at.blank?
  end
  
  def finish
    self.ended_at = Time.now
    self.save
  end
  
  def finished?
    !self.started_at.blank? and !self.ended_at.blank?
  end
  
  def not_started?
    self.ended_at.blank? and self.started_at.blank?
  end
  
  def ready_to_finish?
    self.milestones.where(:ended_at => nil).count == 1
  end
  
  def set_slug
    self.slug = self.title.parameterize
  end
  
  def title_scaped
    if title.size > 70
      title[0,67] + "..."
    else
      title
    end
  end
  
  def days_started
    ((Time.now - (started_at || Time.now))/86400).to_i.abs
  end
  
  def description_scaped
    description[0,140] + "..."
  end
  
  def state_scaped
    return 'Nuevo' if milestones.started.count == 0 and milestones.completed.count == 0
    return 'En Progreso' if milestones.started.count > 0
    return 'Terminado' if milestones.started.count > 0 and milestones.not_started.count == 0
  end
end
