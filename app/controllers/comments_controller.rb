class CommentsController < ApplicationController
  
  def create
    @promise = Promise.find(params[:milestone_id])
    if params[:email].blank?
      @comment = @promise.comments.new_citizen(params[:comment])
      message = @comment.save ? {:notice  => 'Comentario creado'} :  { :error => 'Error al crear el comentario'}
    end
    redirect_to promesa_url(@promise.slug), message || ''
  end
end
