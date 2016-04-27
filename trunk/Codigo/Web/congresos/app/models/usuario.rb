class Usuario < ActiveRecord::Base
	has_many :inscripciones, dependent: :destroy
	belongs_to :evento
	belongs_to :localidad
	self.table_name = "usuarios"
	
	validates :nombre, :apellido, :email, :password, :fecha_nacimiento, :domicilio, 
						:telefono, :dni, :legajo, :activo, presence: { message: "no puede ser vacío" }
	validates :password, length: { minimum: 6, message: "muy corta (al menos 6 caracteres)" }
	validates :legajo, :dni, numericality: { only_integer: true, message: "sólo puede contener números" } 
	validates :legajo, uniqueness: { message: "ya registrado" }
end
