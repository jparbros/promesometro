class Comment < ActiveRecord::Base
  
  belongs_to :commentable, :polymorphic => true
  
  scope :government, where(:kind => 'government')
  scope :citizens, where(:kind => 'citizens')
  scope :approved, where(:approved => true)
  
  def self.government_approved
    government.approved
  end
  
  def self.citizens_approved
    citizens.approved
  end
  
  def self.new_citizen(args)
    self.new args.merge(:kind => 'citizen')
  end
  
  def self.new_government(args)
    self.new args.merge({:kind => 'government', :approved => true})
  end
  
  def approve
    self.approved = true
    self.save
  end
  
  def disapprove
    self.approved = false
    self.save
  end
  
  def citizen?
    self.kind == 'citizens'
  end
  
  def government?
    self.kind == 'government'
  end
end
