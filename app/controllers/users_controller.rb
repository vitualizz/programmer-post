class UsersController < ApplicationController  
  before_action :authenticate_user!
  def disconnect
    current_user.disconnect params[:social]
    redirect_to socials_path
  end
end
