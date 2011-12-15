# encoding: utf-8
class PromesasController < ApplicationController  
  def index
    @search = PromiseSearch.new({params[:search].try(:to_sym) => params[:query]}, params[:page])
    @promises = @search.promises
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
    @comments = @promise.comments.approved.page(params[:page]).per(5)
  end
end
