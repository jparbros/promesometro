class Comment < ActiveRecord::Base
  
  #
  # Associations
  #
  belongs_to :commentable, :polymorphic => true
  
  #
  # Scopes
  #
  scope :government, where(:kind => 'government')
  scope :citizens, where(:kind => 'citizen')
  scope :approved, where(:approved => true)
  
  #
  # Callbacks
  #
  after_create :publish
  
  class << self
    def government_approved
      government.approved
    end

    def citizens_approved
      citizens.approved
    end

    def new_citizen(args)
      self.new args.merge({:kind => 'citizen', :approved => true})
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
  
  def publish
    publisher = Publisher.new(self.comment, self.commentable.slug)
    publisher.publish
  end
end
