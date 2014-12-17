class AdminController < ApplicationController
  before_filter :require_signin!
  def index
    @q, @staffs = StaffQuery.search params[:q], params[:page]
    render :index
  end
end