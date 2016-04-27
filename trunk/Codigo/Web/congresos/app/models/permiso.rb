class Permiso < ActiveRecord::Base
	belongs_to :seccion
  belongs_to :administrador
  self.table_name = "permisos"
end
