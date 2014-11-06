class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    user = current_user
    user.update_attributes(profile_pic: user_params["profile_pic"])
    redirect_to user_path(current_user)
  end

  def audio
    
  end

  private

  def user_params
    params.require(:user).permit(:profile_pic)
  end
  
end
