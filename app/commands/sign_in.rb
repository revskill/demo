module SignIn
  class InvalidCredential < StandardError
    def initialize(msg = I18n.t("sessions.create.error"))
      super
    end
  end

  def self.complete!(email, password)
    raise InvalidCredential if password.nil? or email.nil?
    staff = Staff.where(:mail_address => email).first    
    if staff and staff.login_password == password
      return staff
    else
      raise InvalidCredential
    end
  end
end