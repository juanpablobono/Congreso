class FixForeignKeys < ActiveRecord::Migration
  def up
  	add_reference :cursos, :evento, index: true, foreign_key: true
  	add_reference :inscripciones, :evento, index: true, foreign_key: true
  	add_reference :inscripciones, :curso, index: true, foreign_key: true

  	Curso.reset_column_information
  	Curso.all.each do |curso|
  		curso.update_attribute :evento_id, curso.event_id
  	end

  	Inscripcion.reset_column_information
  	Inscripcion.all.each do |inscripcion|
  		inscripcion.update_attribute :evento_id, inscripcion.event_id
  		inscripcion.update_attribute :curso_id, inscripcion.curso_id
  	end

  	remove_column :cursos, :event_id
  	remove_column :inscripciones, :course_id
  	remove_column :inscripciones, :event_id
  end
end
