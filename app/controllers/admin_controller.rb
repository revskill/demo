class AdminController < ApplicationController
  before_filter :require_signin!
  def index
    @staffs = Staff.all
  end

 
end