class Admin::HomesController < ApplicationController
  
  def top
    @post = Post.find(params[])
  end
  
end
