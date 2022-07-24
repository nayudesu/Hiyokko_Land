class Admin::GenresController < ApplicationController

  before_action :authenticate_admin!

  def create
    @genre = Genre.new(genres_params)
    @genre.save
    redirect_to admin_genres_path
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genres_params)
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルの編集が完了しました。"
    else
      render :edit
      flash[:notice] = "ジャンルの編集に失敗しました。"
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genres_params
    params.require(:genre).permit(:name)
  end

end
