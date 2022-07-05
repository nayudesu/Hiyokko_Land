class Public::MembersController < ApplicationController
  def show
    @member = Memner.find(params[:id])
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    @member = @member.update(member_params)
    redirect_to edit_public_member_path(current_member.id)
  end 
  
  private
  
  def member_params
    params.require(:member).permit(:profile_image, :nickname, :email, :introduction)
  end 
end
