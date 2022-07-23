class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @members = Member.page(params[:page]).per(20)
  end

end
