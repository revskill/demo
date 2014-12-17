module StaffQuery
  def self.fetch_page page
    Staff.includes(:salon).page page
  end
end