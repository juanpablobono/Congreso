class Evento < ActiveRecord::Base
	has_many :cursos, dependent: :destroy
	self.table_name = "eventos"

	validates :fecha_inicio, :fecha_fin, :descripcion, :lugar, presence: true
end
