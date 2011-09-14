class Topic < ActiveRecord::Base
  
  #
  # Validates
  #
  validates :name, :presence => true, :uniqueness => true
  
  has_and_belongs_to_many :promises
  #
  # Scopes
  #
  default_scope order('position ASC')
  
  class << self
    def update_sort(topic_sort)
      topic_sort.each_with_index do |topic,index|
        topic = find(topic)
        topic.update_attribute(:position, index)
      end
    end
    
    def grouped_by_first_letter
      self.all.group_by {|topic| topic.name.chars.first.upcase}
    end
  end
  
end
