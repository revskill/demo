module CheckPasswordComplexityService

  def self.has_normal_letters? password
    password.match(/[A-Za-z]/) ? true : false
  end

  def self.has_digits? password
    password.match(/\d/) ? true : false
  end

  def self.has_extra_chars? password
    password.match(/[\~\!\@\#\$\%\^\&\*\(\)\_\+\|\}\{\"]/) ? true : false
  end

  def self.valid? password
    has_normal_letters? password and has_digits? password and has_extra_chars? password
  end
 
end