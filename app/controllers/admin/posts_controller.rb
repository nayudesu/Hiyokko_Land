class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @member = @post.member
    @post_comments = PostComment.all
  end

  def index
    @posts = Post.all
    @genres = Genre.all
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def search
    @posts = Post.search(params[:genre_id])
    @genre = Genre.find(params[:genre_id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :genre_id, :title, :body)
  end

end
