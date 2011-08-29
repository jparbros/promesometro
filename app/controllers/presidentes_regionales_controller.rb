class PresidentesRegionalesController < ApplicationController
  
  def index
    @officials = Official.governors
  end
  
  def show
    @official = Official.find(params[:id])
  end
end
