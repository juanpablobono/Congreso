class CreatePermisos < ActiveRecord::Migration
  def change
    create_table :permisos do |t|
    	t.references :seccion, index: true, foreign_key: true
      t.references :administrador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
