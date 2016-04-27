class FixTablesName < ActiveRecord::Migration
  def change
  	rename_table :events, :eventos
  	rename_table :courses, :cursos
  	rename_table :enrollments, :inscripciones
  	rename_table :users, :usuarios
  end
end
