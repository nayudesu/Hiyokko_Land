class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @keyword = params[:keyword]

    if @range == 'ユーザー'
      @members = Member.looks(@keyword).page(params[:page]).per(10)
    else
      @posts = Post.looks(@keyword).page(params[:page]).per(4)
    end
  end

end
