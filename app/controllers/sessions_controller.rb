class SessionsController < ApplicationController
  def new
    redirect_to root_path and return if current_staff
  end

  def create
    begin    
      SignIn.complete! params[:signin][:staff_mail_address], params[:signin][:staff_login_password], cookies, session, flash 
      redirect_to root_url
    rescue StandardError => e
      flash[:error] = e.message
      render :new
    end
  end

  def destroy    
    session[:staff_id] = nil
    flash[:notice] = I18n.t "sessions.destroy.notice"
    redirect_to signin_url
  end
end