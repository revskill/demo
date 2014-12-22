require 'string'
class AdminController < ApplicationController
  before_filter :require_signin!

  def index
    @search, @staffs = StaffQuery.search params[:q], params[:page]
    render :index
  end

  def password
  	@current_staff = StaffQuery.find(params[:id])

  end

  def change_password
    @current_staff = StaffQuery.find(params[:id])
    begin
      @errors = SavePassword.save! @current_staff, password_params[:password]
      if @errors.empty?
        flash[:success] = "Mật khẩu đã được lưu"
        redirect_to password_path @current_staff
      else
        flash[:error] = "Bạn nhập mật khẩu không phù hợp với chính sách bảo mật mật khẩu"
        render :password
      end
    rescue Exception => e
      flash[:error] = e.message
      render :password
    end
  end
  
  private
  def password_params
    params.require(:staffs).permit(:password)
  end
  def errors
    @errors ||= []
  end
  helper_method :errors
end