class TemasController < ApplicationController
  
  def Index
    @temas = Topic.all
  end
end
