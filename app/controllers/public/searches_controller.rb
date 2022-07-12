class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @keyword = params[:keyword]

    if @range == 'ユーザー'
      @members = Member.looks(@keyword)
    else
      @posts = Post.looks(@keyword)
    end
  end
end
