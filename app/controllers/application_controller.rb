class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource
  


  protected

    def layout_by_resource
      users_excempt_list = [
        :show, :edit
      ]

      if devise_controller? && resource_name == :admin
        "admin"
      elsif devise_controller? && resource_name == :user && !users_excempt_list.include?(action_name.to_sym)
        "sessions"
      else
        "application"
      end
    end

end
