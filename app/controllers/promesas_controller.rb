class PromesasController < ApplicationController
  
  def index
    @search = Promise.search(params[:search])
    @promises = @search.all
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
  end
end
