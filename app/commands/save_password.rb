module SavePassword
  def self.save!(staff, new_password)
    PasswordValidator.reset_errors
    PasswordValidator.validate(staff.login_password, new_password)
    if PasswordValidator.errors.empty?
      staff.login_password = new_password
      staff.save!
      []
    else
      PasswordValidator.errors
    end
  end
end