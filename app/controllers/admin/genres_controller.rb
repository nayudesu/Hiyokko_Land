class Admin::GenresController < ApplicationController
  
  def create
  end 
  
  def index
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update 
  end 
  
  def destory
  end 
  
end
