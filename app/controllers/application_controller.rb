class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery

  private
  def set_locale
    I18n.locale = params[:locale] || 'vi'
  end
  def require_signin!
    if current_staff.nil?
      flash[:error] =
       I18n.t 'application.require_signin.error'
      redirect_to signin_path
    else
      if current_staff.one_time_secret.nil? and cookies[current_staff.id.to_s]
        session[:staff_id] = nil
        redirect_to signin_path
      end
    end
  end
  helper_method :require_signin!
  def current_staff
    @current_staff ||= StaffQuery.find session[:staff_id] if session[:staff_id]
  end
  helper_method :current_staff
end
