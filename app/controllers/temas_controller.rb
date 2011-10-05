class TemasController < ApplicationController
  
  def index
    @search = Topic.search(params[:search])
    @temas = @search.page(params[:page])
  end
end
