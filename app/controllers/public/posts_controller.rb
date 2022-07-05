class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to public_posts_show_path(@post)
    else
      render 'new'
    end 
  end 

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
  end 
    
  private
  
  def post_params
    params.require(:post).permit(:image, :genre_id, :title, :body)
  end 
end
