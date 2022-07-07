class Public::MembersController < ApplicationController
  
  before_action :authenticate_member!

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member = @member.update(member_params)
    redirect_to member_path(current_member.id)
  end
  
  def unsubscribe
    @member = Member.find(params[:id])
  end 
  
  def withdraw
    @member = Member.find(params[:id])
    @member.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end 

  private

  def member_params
    params.require(:member).permit(:profile_image, :nickname, :email, :introduction)
  end
  
  
end
