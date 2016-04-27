class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :fecha_inicio
      t.string :fecha_fin
      t.text :descripcion
      t.string :lugar

      t.timestamps null: false
    end
  end
end
