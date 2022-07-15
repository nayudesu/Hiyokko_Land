class Public::HomesController < ApplicationController

  def top
  end

  def about
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
end
