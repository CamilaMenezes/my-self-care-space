class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.professional?
      edit_professional_info_path
    else
      my_profile_path
    end
  end
end