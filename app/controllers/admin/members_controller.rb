class Admin::MembersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def index
    @members = Member.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to admin_member_path(@member)
      flash[:notice] = "マイページの編集が完了しました。"
    else
      render :edit
      flash[:notice] = "マイページの編集に失敗しました。"
    end
  end

  def destory
    @member = Member.find(params[:id])
    @member.destory
    redirect_to admin_members_path
  end

  private

  def member_params
    params.require(:member).permit(:profile_image, :nickname, :email, :introduction, :is_deleted)
  end

end
