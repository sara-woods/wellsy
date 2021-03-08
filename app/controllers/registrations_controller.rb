class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      my_profile_path
    end
end