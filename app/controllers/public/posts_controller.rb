class Public::PostsController < ApplicationController

  before_action :authenticate_member!

  def new
    @post = Post.new
   # @genres = Genre.all
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = "投稿されました！"
    else
      render :new
      flash[:notice] = "投稿に失敗しました。"
    end
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

  def show
    @post = Post.find(params[:id])
    @member = @post.member
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
    if @post.member == current_member
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = "編集が更新されました！"
    else
      render :edit
      flash[:notice] = "更新に失敗しました。"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
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
