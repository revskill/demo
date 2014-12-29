module SignIn
  class InvalidCredential < StandardError
    def initialize(msg = I18n.t("sessions.create.error"))
      super
    end
  end
  class NuLLEmail < StandardError
    def initialize(msg = I18n.t("sessions.create.nullemail"))
      super
    end
  end
  class NullPassword < StandardError
    def initialize(msg = I18n.t("sessions.create.nullpassword"))
      super
    end
  end
  class NullEmailAndPassword < StandardError
    def initialize(msg = I18n.t("sessions.create.nullemailandpassword"))
      super
    end
  end
  class InvalidToken1 < StandardError
    def initialize(msg = I18n.t("sessions.create.invalidtoken1"))
      super
    end
  end
  class InvalidToken2 < StandardError
    def initialize(msg = I18n.t("sessions.create.invalidtoken2"))
      super
    end
  end
  class InvalidToken3 < StandardError
    def initialize(msg = I18n.t("sessions.create.invalidtoken3"))
      super
    end
  end
  
  def self.complete!(email, password, cookies, session, flash)
    raise NuLLEmail if !email.present? and password.present?
    raise NullPassword if email.present? and !password.present?
    raise NullEmailAndPassword if !email.present? and !password.present?
    staff = Staff.where(:mail_address => email).first    
    raise InvalidCredential if staff.nil? or (staff and staff.login_password != password)
    raise InvalidToken1 if cookies[staff.id.to_s].nil? and staff.one_time_secret.present?
    #raise InvalidToken2 if (staff.token.nil? and cookie_token)
    raise InvalidToken3  if (staff.one_time_secret.present? and cookies[staff.id.to_s] and staff.one_time_secret != cookies[staff.id.to_s])
    token = SaveStaffToken.do! staff
    cookies[staff.id.to_s] = staff.one_time_secret
    session[:staff_id] = staff.id
    flash[:notice] = I18n.t "sessions.create.notice"
  end
end