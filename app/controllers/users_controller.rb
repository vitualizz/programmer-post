class UsersController < ApplicationController  
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def disconnect
    current_user.disconnect params[:social]
    redirect_to socials_path
  end
end
