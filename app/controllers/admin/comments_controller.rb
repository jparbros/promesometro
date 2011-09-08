class Admin::CommentsController < Admin::BaseController
  
  def index
    @comments = Comment.all
  end
  
  def create
    @milestone = Milestone.find(params[:milestone_id])
    @comment = @milestone.comments.new_government(params[:comment])
    message = @comment.save ? {:notice  => 'Comentario creado'} :  { :error => 'Error al crear el comentario'}
    redirect_to admin_official_promise_url(@milestone.promise.official, @milestone.promise), message
  end
end
