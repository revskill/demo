module SessionsConcern
  extend ActiveSupport::Concern

  included do
  	before_filter :require_cookies!
  end

  def render_login(current_staff)
  	redirect_to root_path and return if current_staff
  end

  def logout(session, flash)
  	session[:staff_id] = nil
    flash[:notice] = I18n.t "sessions.destroy.notice"
    redirect_to signin_url
  end

  def login(params, cookies, session, flash)
  	begin    
      SignIn.complete! params[:signin][:staff_mail_address], params[:signin][:staff_login_password], cookies, session, flash 
      redirect_to root_url
    rescue StandardError => e
      flash[:danger] = e.message
      render :new
    end
  end
end