module StaffQuery
  def self.fetch_page page
    Staff.includes(:salon).page page
  end

  def self.search query, page
  	qu = Staff.search query
  	staffs = qu.result.includes(:salon).page page
  	return qu, staffs
  end
end