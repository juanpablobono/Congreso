class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :password
      t.string :fecha_nacimiento
      t.string :domicilio
      t.string :telefono
      t.string :dni
      t.string :piso
      t.string :departamento
      t.integer :legajo
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
