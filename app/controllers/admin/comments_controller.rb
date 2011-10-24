class Admin::CommentsController < Admin::BaseController
  
  def index
    @comments = Comment.page(params[:page]).order('created_at DESC')
  end
  
  def create
    @promise = Promise.find(params[:milestone_id])
    @comment = @promise.comments.new_government(params[:comment])
    message = @comment.save ? {:notice  => 'Comentario creado'} :  { :error => 'Error al crear el comentario'}
    redirect_to admin_official_promise_url(@promise.official, @promise), message
  end
  
  def destroy
     @promise = Promise.find(params[:milestone_id])
     @comment = @promise.comments.find(params[:id])
     message = @comment.destroy ? {:notice  => 'Comentario eliminado'} :  { :error => 'Error al eliminar el comentario'}
     redirect_to :back
  end
end
