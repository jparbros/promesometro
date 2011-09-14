class PromesasController < ApplicationController
  
  def index
    @search = Promise.search(params[:search])
    @promises = @search.all
    @topics = Topic.grouped_by_first_letter
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
  end
end
