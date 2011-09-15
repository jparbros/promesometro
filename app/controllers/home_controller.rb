class HomeController < ApplicationController
  
  def show
    @government = Comment.government.limit(10).order('id DESC')
    @citizens = Comment.citizens_approved.limit(10).order('id DESC')
  end
  
end
