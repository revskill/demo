module ResetStaffToken
  def self.do!(staff, flash)
    staff.one_time_secret = nil
    staff.save!
    flash[:success] = I18n.t("admin.reset_token.success")
  end
end