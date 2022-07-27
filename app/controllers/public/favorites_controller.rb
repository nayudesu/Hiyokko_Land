class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!

  def create
    @post = Post.find(params[:post_id])
    favorite = current_member.favorites.new(post_id: @post.id)
    favorite.save

  end

  def destroy
    @post = Post.find(params[:post_id])
    post_id = params[:post_id].to_i
    favorite = Favorite.find_by(member_id: current_member.id, post_id: post_id)
    favorite.destroy
  end

  def favorite
    @member = Member.find(params[:id])
    favorites = Favorite.where(member_id: @member.id).pluck(:post_id)
    @posts = Post.where(id: favorites).page(params[:page]).per(4)
  end

end
