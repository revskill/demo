class AdminController < ApplicationController
  before_filter :require_signin!
  def index
    @staffs = StaffQuery.fetch_page params[:page]
  end

 
end