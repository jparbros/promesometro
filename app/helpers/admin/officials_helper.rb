module Admin::OfficialsHelper
  
  def official_positions
    @positions ||= Official::POSITIONS.collect {|position| [position, Official::POSITIONS.index(position)]}
  end
  
  def provinces_disabled?(object)
    (object.province.nil? ? 'disabled': false )
  end
  
  def provinces_class(object)
    (object.province.nil? ? 'uneditable-input' : nil)
  end
end
