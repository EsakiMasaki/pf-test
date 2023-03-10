class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :permitted_parameters ,if: :devise_controller?

  def after_sign_in_for(resource)
    root_path
  end

  def permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name,:email])
  end
end
