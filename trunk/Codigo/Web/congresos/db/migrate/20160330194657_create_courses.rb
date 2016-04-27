class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nombre
      t.text :descripcion
      t.boolean :activo
      t.string :dia_hora
      t.integer :duracion

      t.timestamps null: false
    end
  end
end
