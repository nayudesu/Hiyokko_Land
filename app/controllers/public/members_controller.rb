class Public::MembersController < ApplicationController

  before_action :authenticate_member!, except: [:index]
  before_action :ensure_guest_member, only: [:edit]

  def index
    redirect_to  new_member_registration_path
  end

  def show
    @member = Member.find(params[:id])
    @posts = @member.posts
  end

  def edit
    @member = Member.find(params[:id])
    if @member == current_member
      render "edit"
    else
      redirect_to posts_path
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member = @member.update(member_params)
      redirect_to member_path(current_member.id)
      flash[:notice] = "マイページが編集されました！"
    else
      render :edit
      flash[:notice] = "更新に失敗しました。"
    end
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

  def ensure_guest_member
    @member = Member.find(params[:id])
    if @member.nickname == "ゲスト"
      redirect_to member_path(current_member) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
