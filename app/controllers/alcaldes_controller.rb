class AlcaldesController < ApplicationController
  
  def index
    @search = Promise.search(params[:search])
    @officials = Official.mayors
  end
  
  def show
    @search = Promise.search(params[:search])
    @official = Official.find(params[:id])
  end
end
