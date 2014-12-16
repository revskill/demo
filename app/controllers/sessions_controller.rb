class SessionsController < ApplicationController
  def new

  end

  def create
    staff = Staff.where(:mail_address => params[:signin][:staff_mail_address]).first
    if staff && staff.authenticate(params[:signin][:staff_login_password])
      session[:staff_id] = staff.id
      flash[:notice] = "Signed in successfully."
      redirect_to root_url
    else
      flash[:error] = "Sorry."
      render :new
    end
  end
end