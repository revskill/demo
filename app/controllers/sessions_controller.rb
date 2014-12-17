class SessionsController < ApplicationController
  def new

  end

  def create
    begin
      staff = SignIn.complete! params[:signin][:staff_mail_address], params[:signin][:staff_login_password]
      session[:staff_id] = staff.id
      flash[:notice] = I18n.t("sessions.create.notice")
      redirect_to root_url
    rescue StandardError => e
      flash[:error] = e.message
      render :new
    end
  end

  def destroy
    session[:staff_id] = nil
    flash[:notice] = I18n.t("sessions.destroy.notice")
    redirect_to signin_url
  end
end