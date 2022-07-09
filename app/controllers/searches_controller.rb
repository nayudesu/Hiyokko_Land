class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    
    if @range == 'Member'
      @members = Member.looks(params[:keyword])
    else
      @posts = Post.looks(params[:keyword])
    end 
    
  end 
end
