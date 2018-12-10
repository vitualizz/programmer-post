class UsersController < ApplicationController  
  def disconnect
    current_user.disconnect params[:social]
    redirect_to socials_path
  end
end
