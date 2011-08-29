class Milestone < ActiveRecord::Base
  
  #
  # Associations
  #
  belongs_to :promise
  has_many :notes#, :polymorphic => true
  
  state_machine :state, :initial => :new do
    state :new
    state :in_progress
    state :finished
    
    event :start do
      transition :to => :in_progress, :from => :new
    end
    
    event :finish do
      transition :to => :finished, :from => :in_progress
    end
  end
end
