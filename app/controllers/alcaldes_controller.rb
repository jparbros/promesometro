class AlcaldesController < ApplicationController
  
  def index
    @officials = Official.mayors
  end
  
  def show
    @official = Official.find(params[:id])
  end
end
