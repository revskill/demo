require 'string'
class AdminController < ApplicationController
  include AdminConcern

  def index
    search params, StaffQuery
  end

  def password
    render_password_view params, StaffQuery
  end

  def change_password
    do_change_password ChangeStaffPassword, StaffQuery, SavePassword, password_params, params, flash
  end
  
  def modal
    show_modal StaffQuery, params
  end

  def reset
    reset_ipad StaffQuery, ResetStaffToken, params, flash
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