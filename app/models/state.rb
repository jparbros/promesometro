class State < ActiveRecord::Base
  #
  # Associations
  #
  has_many :provinces
  has_one :official
end
