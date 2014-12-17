class Staff < ActiveRecord::Base
  self.table_name ='T_STAFF'
  self.primary_key = 'staff_id'

  belongs_to :salon, class_name: 'Salon', foreign_key: 'salon_id'
  paginates_per 50
end