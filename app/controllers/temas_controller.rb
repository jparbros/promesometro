class TemasController < ApplicationController
  
  def show
    @topic = Topic.find(params[:id])
    @promises = @topic.promises
  end
end
