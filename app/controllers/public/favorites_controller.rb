class Public::FavoritesController < ApplicationController

   before_action :authenticate_member!

  def create
    post = Post.find(params[:post_id])
    favorite = current_member.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
  end

  def destroy
    post_id = params[:post_id]
    favorite = Favorite.find_by(member_id: current_member.id, post_id: post_id)
    favorite.destroy
    redirect_to post_path(post_id)
  end

end
