class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @member = @post.member
  end

  def index
    @genres = Genre.all

    if params[:latest]
      @posts = Post.latest
    elsif params[:old]
      @posts = Post.old
    elsif params[:favorite_count]
      @posts = Post.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
    else
      @posts = Post.all
    end
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(4)
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post)
      flash[:notice] = "投稿の編集が完了しました。"
    else
      render :edit
      flash[:notice] = "更新に失敗しました。"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def search
    @posts = Post.search(params[:genre_id])
    @genre = Genre.find(params[:genre_id])
    @posts = @posts.page(params[:page]).per(4)
  end

  private

  def post_params
    params.require(:post).permit(:image, :genre_id, :title, :body)
  end

end
