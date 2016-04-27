class CreateSesiones < ActiveRecord::Migration
  def change
    create_table :sesiones do |t|
      t.string :inicio_sesion
      t.string :uuid
      t.belongs_to :usuario, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
