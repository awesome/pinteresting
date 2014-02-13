class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname << :membername << :gender << :location
    devise_parameter_sanitizer.for(:account_update) << :firstname << :lastname << :membername << :description << :gender << :location << :avatar_file_name << :avatar_content_type << :avatar_file_size << :avatar_updated_at << :avatar
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_up_path_for(resource)
    dashboard_path
  end

end