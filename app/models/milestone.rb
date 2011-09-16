class Milestone < ActiveRecord::Base
  
  #
  # Associations
  #
  belongs_to :promise

  #
  # States Machine
  #
  state_machine :state, :initial => :new do
    state :new
    state :in_progress
    state :finished
    
    after_transition :new => :in_progress, :do => :start_milestone
    after_transition :in_progress => :finished, :do => :finish_milestone
    
    event :start do
      transition :to => :in_progress, :from => :new
    end
    
    event :finish do
      transition :to => :finished, :from => :in_progress
    end
  end
  
  #
  # Delegates
  #
  delegate :start, :to => :promise, :allow_nil => true, :prefix => true
  delegate :started?, :to => :promise, :allow_nil => true, :prefix => true
  delegate :finish, :to => :promise, :allow_nil => true, :prefix => true
  delegate :ready_to_finish?, :to => :promise, :allow_nil => true, :prefix => true
  
  def start_milestone
    self.started_at = Time.now
    self.save
    self.promise_start unless self.promise_started?
  end
  
  def finish_milestone
    self.promise_finish if self.promise_ready_to_finish?
    self.ended_at = Time.now
    self.save
  end
end
