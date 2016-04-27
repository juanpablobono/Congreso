class Curso < ActiveRecord::Base
	belongs_to :evento
	self.table_name = "cursos"

	validates :nombre, :descripcion, :activo, :dia_hora, :duracion, presence: { message: "no puede ser vacío" }
	validates :duracion, numericality: { message: "sólo puede contener números" }

end
