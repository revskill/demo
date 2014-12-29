class ChangeStaffPassword
  include Wisper::Publisher
  def perform params
    publish :save_event, params[:id] if params[:save].present?
  end
end