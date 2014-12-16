class SessionsController < ApplicationController
  def new

  end

  def create
    staff = Staff.where(:mail_address => params[:signin][:staff_mail_address]).first
    if staff && staff.authenticate(params[:signin][:staff_login_password])
      session[:staff_id] = staff.id
      flash[:notice] = I18n.t("sessions.create.notice")
      redirect_to root_url
    else
      flash[:error] = I18n.t("sessions.create.error")
      render :new
    end
  end
end