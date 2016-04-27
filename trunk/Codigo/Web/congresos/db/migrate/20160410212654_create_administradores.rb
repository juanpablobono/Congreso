class CreateAdministradores < ActiveRecord::Migration
  def change
    create_table :administradores do |t|
      t.string :nombre
      t.string :apellido
      t.string :usuario
      t.string :password_digest
      t.string :tipo
      t.string :telefono
      t.string :email
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
