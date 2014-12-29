class ApplicationController < ActionController::Base
  before_filter :set_locale
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url
  end
  private
  def set_locale
    I18n.locale = params[:locale] || 'ja'
  end
  def require_signin!
    if current_user.nil?
      #flash[:error] =
       #I18n.t 'application.require_signin.error'
      redirect_to signin_path
    else
      if current_user.one_time_secret.nil? and cookies[current_user.id.to_s]
        session[:staff_id] = nil
        redirect_to signin_path
      end
    end
  end
  helper_method :require_signin!
  def current_user
    @current_staff ||= StaffQuery.find session[:staff_id] if session[:staff_id]
  end
  helper_method :current_user

  def require_cookies!
    if cookies[:test_session].to_s == ''
      cookies[:test_session] = 'testing'
      if params[:cookies_enabled].nil?
        redirect_to :controller => params[:controller],
                    :action => params[:action],
                    :cookies_enabled => 'testing'
      else
        render :text => '<html><body>You need cookies</body></html>'
      end
    end
  end
end
