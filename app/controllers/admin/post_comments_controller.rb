class Admin::PostCommentsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def destroy
    @post = Post.find(params[:id])
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to admin_post_path(@post)
  end 
  
end
