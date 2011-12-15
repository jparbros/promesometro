class PromiseFilterController < ApplicationController
  
  def create
    @search = PromiseSearch.new(params[:search], params[:page])
    @promises = @search.promises
    render 'promesas/index'
  end
end
