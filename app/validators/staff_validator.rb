module StaffValidator
  class InvalidEmail < StandardError; end
                                   
  def self.validate!(record)
    unless record.mail_address =~ /@/   
      raise InvalidEmail
    end
  end
end