class CommentsController < ApplicationController
  
  def create
    @promise = Promise.find(params[:milestone_id])
    @comment = @promise.comments.new_citizen(params[:comment])
    message = @comment.save ? {:notice  => 'Comentario creado'} :  { :error => 'Error al crear el comentario'}
    redirect_to promesa_url(@promise.slug), message
  end
end
