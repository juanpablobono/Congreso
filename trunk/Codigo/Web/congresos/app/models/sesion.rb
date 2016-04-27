class Sesion < ActiveRecord::Base
  belongs_to :usuario
  self.table_name = "usuarios"
end
