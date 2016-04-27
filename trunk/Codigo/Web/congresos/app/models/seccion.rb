class Seccion < ActiveRecord::Base
	self.table_name = "secciones"
	belongs_to :seccion_padre, class_name: "Seccion"
	has_many :secciones_hijas, class_name: "Seccion", foreign_key: "seccion_padre_id"
end
