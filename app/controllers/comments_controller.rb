class CommentsController < ApplicationController
  
  def create
    @milestone = Milestone.find(params[:milestone_id])
    @comment = @milestone.comments.new_citizen(params[:comment])
    message = @comment.save ? {:notice  => 'Comentario creado'} :  { :error => 'Error al crear el comentario'}
    redirect_to promesa_url(@milestone.promise.slug), message
  end
end
