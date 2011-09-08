class RegionesController < ApplicationController
  
  def index
    
  end
  
  def show
    @region = State.find_by_name(params[:region_name].gsub('_',' '))
  end
end
