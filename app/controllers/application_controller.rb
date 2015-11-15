class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_filter :configure_permitted_parameters, :only => [:create]
  before_action :configure_permitted_parameters, :if => :devise_controller?, :only => [:create]
  def after_sign_in_path_for(user)
         users_dashboard_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name,:email, :password, :address) }
    end
end
