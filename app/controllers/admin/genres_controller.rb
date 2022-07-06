class Admin::GenresController < ApplicationController

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
    @genre.update(genres_params)
    redirect_to admin_genres_path
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
