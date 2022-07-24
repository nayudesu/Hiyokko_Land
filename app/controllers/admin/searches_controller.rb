class Admin::SearchesController < ApplicationController

  def search
    @range = params[:range]
    @keyword = params[:keyword]

    if @range == 'ユーザ'
      @members = Member.looks(@keyword)
      @members = Member.page(params[:page]).per(10)
    else
      @posts = Post.looks(@keyword)
      @posts = @posts.page(params[:page]).per(4)
    end
  end

end
