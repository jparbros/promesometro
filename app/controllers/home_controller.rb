class HomeController < ApplicationController
  
  def show
    @government = Comment.government
    @citizens = Comment.citizens_approved
  end
  
end
