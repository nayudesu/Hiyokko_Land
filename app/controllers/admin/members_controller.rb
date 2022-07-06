class Admin::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @posts = @member.post
  end

  def index
    @member = Member.all
  end

  def edit
  　@member = Member.find(params[:id])
  end
end
