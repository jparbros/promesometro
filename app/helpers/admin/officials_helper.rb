module Admin::OfficialsHelper
  
  def official_positions
    @positions ||= Official::POSITIONS.collect {|position| [position, Official::POSITIONS.index(position)]}
  end
end
