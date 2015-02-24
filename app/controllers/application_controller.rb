class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  helper_method :admin?
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    user_url(user)
  end

  def admin?
    current_user.admin if current_user
  end

  def user_authenticate
      redirect_to login_path unless current_user
  end

  def require_admin
    if !admin?
      redirect_to root_path notice: "Not Allowed, contact admin."
    end
  end

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :profile_name, :phone_number,
                                                      :email, :password, :password_confirmation) }
  end

end
