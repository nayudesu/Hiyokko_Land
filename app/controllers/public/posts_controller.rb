class Public::PostsController < ApplicationController
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    # @post.user_id = current_user.id
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
  end

  def edit
  end
  
  private
  
  def post_params
    params.require(:post).permit(:image, :genre, :title, :body)
  end 
end
