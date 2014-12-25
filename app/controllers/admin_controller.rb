require 'string'
class AdminController < ApplicationController
  before_filter :require_signin!

  def index
    @search, @staffs = StaffQuery.search params[:q], params[:page]
    render :index
  end

  def password
  	@staff = StaffQuery.find(params[:id])

  end

  def change_password
    change_password = ChangeStaffPassword.new
    change_password.on(:generate_event) do |staff_id|
      @staff = StaffQuery.find(staff_id)
      @token = GeneratePasswordService.generate
      flash[:success] = flash[:error] = nil
      render :password
    end
    change_password.on(:show_event) do |staff_id| 
      @staff = StaffQuery.find(staff_id)
      @token = password_params[:password]
      @show = true
      render :password
    end
    change_password.on(:hide_event) do |staff_id|
      @staff = StaffQuery.find(staff_id)
      @token = password_params[:password]
      @show = nil
      render :password
    end
    change_password.on(:save_event) do |staff_id|
      @staff = StaffQuery.find(staff_id)
      begin
        @errors = SavePassword.save! @staff, password_params[:password]
        if @errors.empty?
          flash[:success] = I18n.t("admin.change_password.success")
          redirect_to password_path @staff
        else
          flash[:error] = I18n.t("admin.change_password.error")
          render :password
        end
      rescue Exception => e
        flash[:error] = e.message
        render :password
      end
    end
    change_password.perform params
  end
  
  def modal
    @staff = StaffQuery.find(params[:id])
    render :modal, :layout => false
  end

  def reset
    begin
      ResetStaffToken.do! params[:id], flash      
      redirect_to root_path
    rescue Exception => e
      flash[:error] = I18n.t("admin.reset_token.error")
      redirect_to root_path
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