class Public::PostsController < ApplicationController

  before_action :authenticate_member!

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all

    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:favorite_count]
      @posts = Post.favorite_count
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
    @member = @post.member
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
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
