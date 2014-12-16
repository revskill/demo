class Staff < ActiveRecord::Base
  self.table_name ='T_STAFF'
  self.primary_key = 'staff_id'
  def authenticate(password)
    return false if password.nil?
    login_password == password
  end
end