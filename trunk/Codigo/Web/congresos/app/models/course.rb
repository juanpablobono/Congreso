class Course < ActiveRecord::Base
	belongs_to :event

	validates :nombre, :descripcion, :activo, :dia_hora, :duracion, presence: { message: "no puede ser vacío" }
	validates :duracion, numericality: { message: "sólo puede contener números" }

end
