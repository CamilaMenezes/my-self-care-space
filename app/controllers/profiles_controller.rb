class ProfilesController < ApplicationController
  
  def my_profile
  end

  def edit_professional_info
  end
  
  def update_professional_info
    @user = current_user
    if @user.update(user_params)
      redirect_to my_profile_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:profession, :description, :address)
  end
end
