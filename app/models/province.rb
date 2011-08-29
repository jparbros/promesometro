class Province < ActiveRecord::Base
  belongs_to :state
  has_one :official
end
