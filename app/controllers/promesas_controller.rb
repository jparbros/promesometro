class PromesasController < ApplicationController
  
  def index
    @topics = Topic.all
  end
  
  def show
    @official = Official.find(params[:alcalde_id] || params[:presidentes_regionale_id])
    @promise = @official.promises.find(params[:id])
  end
end
