class Administrador < ActiveRecord::Base
	self.table_name = "administradores"
  has_secure_password
  after_destroy :ensure_an_admin_remains

  validates :usuario, uniqueness: { message: "debe ser único" }
  validates :usuario, presence: true

  #validates :password, allow_blank: true, on: :update
  #validates :usuario, :password, presence: { message: "no puede ser vacío" }

  private 
  	def ensure_an_admin_remains
  		if Administrador.count.zero?
				raise "No se puede eliminar el único administrador."
			end
  	end
end
