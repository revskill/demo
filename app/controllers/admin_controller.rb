class AdminController < ApplicationController
  before_filter :require_signin!
  def index
    @search, @staffs = StaffQuery.search params[:q], params[:page]
    render :index
  end
end