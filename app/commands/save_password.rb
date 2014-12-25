module SavePassword
  def self.save!(staff, new_password)
    validator = PasswordValidator.new
    validator.validate(staff.login_password, new_password)
    if validator.errors.empty?
      staff.login_password = new_password
      staff.save!
      []
    else
      validator.errors
    end
  end
end