module SaveStaffToken
  def self.do! staff
    token = GenerateTokenService.generate
    staff.one_time_secret = token
    staff.save!
    token
  end
end