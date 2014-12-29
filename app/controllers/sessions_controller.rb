class SessionsController < ApplicationController
  include SessionsConcern
  
  def new
    render_login current_user
  end

  def create
    login params, cookies, session, flash
  end

  def destroy    
    logout session, flash
  end
end