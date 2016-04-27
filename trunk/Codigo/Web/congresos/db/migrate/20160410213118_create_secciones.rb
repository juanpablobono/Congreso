class CreateSecciones < ActiveRecord::Migration
  def change
    create_table :secciones do |t|
      t.string :nombre
      t.references :seccion_padre, index: true

      t.timestamps null: false
    end
  end
end
