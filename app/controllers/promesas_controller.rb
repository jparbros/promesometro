# encoding: utf-8
class PromesasController < ApplicationController  
  def index
    unless params[:search].nil? || params[:search][:general_search].nil?
      @search = Promise.search()
      @promises = Promise.general_search(params[:search][:general_search])
    else
      @search = Promise.search(params[:search])
      @promises = @search.page(params[:page])
    end
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
    @comments = @promise.comments.approved.page(params[:page]).per(5)
  end
end
