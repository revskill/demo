module PasswordValidator
  @@errors = []

  class NullPassword < StandardError; end
  class WrongNumberOfCharacterPassword < StandardError; end
  class NotLatinPassword < StandardError; end
  class DuplicateOldPassword < StandardError; end
  class InvalidPassword < StandardError; end

  def self.reset_errors
    @errors = []
  end
  def self.errors
    @@errors
  end

  def self.validate(old_password, new_password)
    @@errors << DuplicateOldPassword.new(I18n.t("password_validator.duplicate_old_password")) if old_password == new_password
    validate_other new_password
  end

  def self.validate_other(password)
    @@errors << NullPassword.new(I18n.t("password_validator.null_password")) if password.nil?
    if password.size < 8 or password.size > 16
      @@errors << WrongNumberOfCharacterPassword.new(I18n.t("password_validator.wrong_number_of_character_password"))
    end
    @@errors << NotLatinPassword.new(I18n.t("password_validator.not_latin_password")) unless password.just_latin?
    @@errors << InvalidPassword.new(I18n.t("password_validator.invalid_password"))  unless CheckPasswordComplexityService.valid? password
  end
end