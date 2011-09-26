# encoding: utf-8
class PromesasController < ApplicationController
  add_crumb "Promesas", '/promesas'
  
  def index
    @search = Promise.search(params[:search])
    @promises = @search.all
    @topics = Topic.grouped_by_first_letter
  end
  
  def show
    @search = Promise.search(params[:search])
    @promise = Promise.find_by_slug(params[:slug])
    add_crumb "#{@promise.title[0,20]}", "/promesas/#{@promise.slug}"
  end
end
