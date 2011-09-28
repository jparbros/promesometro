class Admin::CommentApprovalController < ApplicationController
  
  def create
    comment = Comment.find(params[:comment_id])
    comment.approve
    redirect_to :back
  end
  
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.disapprove
    redirect_to :back
  end
end
