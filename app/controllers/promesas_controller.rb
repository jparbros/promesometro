# encoding: utf-8
class PromesasController < ApplicationController
  add_crumb "Promesas", '/promesas'
  
  def index
    @search = Promise.search(params[:search])
    @promises = @search.page(params[:page])
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
    @comments = @promise.comments.page(params[:page]).per(5)
  end
end
