class FixForeignKeys2 < ActiveRecord::Migration
  def up
  	add_reference :inscripciones, :usuario, index: true, foreign_key: true

  	Inscripcion.reset_column_information
  	Inscripcion.all.each do |inscripcion|
  		inscripcion.update_attribute :user_id, inscripcion.user_id
  	end

  	remove_column :inscripciones, :user_id
  end
end
