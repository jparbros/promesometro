class Admin::CommentApprovalController < ApplicationController
  
  def create
    comment = Comment.find(params[:comment_id])
    comment.approve
    redirect_to admin_comments_url
  end
  
  def destroy
    comment = Comment.find(params[:comment_id])
    comment.disapprove
    redirect_to admin_comments_url
  end
end
