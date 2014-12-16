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
       I18n.t('application.require_signin.error')#"You need to sign in or sign up before continuing."
      redirect_to signin_path
    end
  end
  helper_method :require_signin!
  def current_staff
    @current_staff ||= Staff.find(session[:staff_id]) if session[:staff_id]
  end
  helper_method :current_staff
end
