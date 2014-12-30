module AdminConcern
  extend ActiveSupport::Concern
  included do 
    before_filter :require_signin!
    after_filter "save_my_previous_url", only: [:search]
  end

  def search(params, query_klass)
    authorize! :read, :all
    @search, @staffs = query_klass.search params[:q], params[:page]
    if params[:q]
      @role_id = params[:q][:role_id_eq]
      @staff_name = params[:q][:staff_name_cont]
      @mail_address = params[:q][:mail_address_cont]
    end
  end

  def render_password_view(params, query_klass)
    @staff = query_klass.find(params[:id])
    authorize! :manage, @staff
  end

  def do_change_password(change_staff_password_command, staff_query, save_password_command, password_params, params, flash)
    change_password = change_staff_password_command.new    
    change_password.on(:save_event) do |staff_id|
      @staff = staff_query.find(staff_id)
      authorize! :manage, @staff
      begin
        @errors = save_password_command.save! @staff, password_params[:password]
        if @errors.empty?
          flash[:success] = I18n.t("admin.change_password.success")
          redirect_to password_path @staff
        else
          flash[:danger] = I18n.t("admin.change_password.error")
          render :password
        end
      rescue Exception => e
        flash[:danger] = e.message
        render :password
      end
    end
    change_password.perform params
  end

  def show_modal(staff_query, params)
    @staff = staff_query.find(params[:id])
    authorize! :manage, @staff
    render :modal, :layout => false
  end

  def reset_ipad(staff_query, reset_staff_token, params, flash)
    begin
      @staff = staff_query.find(params[:id])
      authorize! :manage, @staff
      reset_staff_token.do! @staff, flash      
      redirect_to session[:my_previouse_url] || root_path
    rescue Exception => e
      flash[:error] = I18n.t("admin.reset_token.error")
      redirect_to root_path
    end
  end

  def save_my_previous_url
    session[:my_previouse_url] = URI(request.referer).path
  end
end