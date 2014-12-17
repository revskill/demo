class Salon < ActiveRecord::Base
  self.table_name ='T_SALON'
  self.primary_key = 'salon_id'
  has_many :staffs, class_name: 'Staff', foreign_key: 'salon_id'
end