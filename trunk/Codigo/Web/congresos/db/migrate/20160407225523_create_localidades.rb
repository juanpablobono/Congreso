class CreateLocalidades < ActiveRecord::Migration
  def change
    create_table :localidades do |t|
      t.string :name
      t.belongs_to :provincia, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
