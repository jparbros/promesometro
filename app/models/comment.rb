class Comment < ActiveRecord::Base
  
  belongs_to :commentable, :polymorphic => true
  
  scope :government, where(:kind => 'government')
  scope :citizens, where(:kind => 'citizen')
  scope :approved, where(:approved => true)
  
  class << self
    def government_approved
      government.approved
    end

    def citizens_approved
      citizens.approved
    end

    def new_citizen(args)
      self.new args.merge(:kind => 'citizen')
    end

    def new_government(args)
      self.new args.merge({:kind => 'government', :approved => true})
    end
    
    def available_comments
      citizens_approved + government_approved
    end
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
    self.kind == 'citizen'
  end
  
  def government?
    self.kind == 'government'
  end
end
