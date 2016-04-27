class Inscripcion < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :curso
	belongs_to :evento
	self.table_name = "inscripciones"

	validates :fecha_alta, presence: true
end
