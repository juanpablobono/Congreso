class Provincia < ActiveRecord::Base
	has_many :localidades, dependent: :destroy
	belongs_to :pais
	# Ver config/initializers/inflections.rb
	self.table_name = "provincias"
end
