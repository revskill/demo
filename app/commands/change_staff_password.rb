class ChangeStaffPassword
  include Wisper::Publisher
  def perform params
    ["generate", "show", "hide"].each do |a|
      publish (a + "_event").to_sym, params[:id]  if params[a.to_sym]
    end
    publish :save_event, params[:id] if params[:save]
  end
end