class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  
  def my_profile
  end

  def show
    @professional = User.find(params[:id])
    unless @professional.professional?
      redirect_to root_path, alert: "Ação não autorizada"
    end
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
