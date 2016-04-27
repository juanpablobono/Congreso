class FixSomeNames < ActiveRecord::Migration
  def change
  	rename_column :usuarios, :password, :contrasenia
  	add_reference :usuarios, :evento, index: true, foreign_key: true
  	add_reference :usuarios, :localidad, index: true, foreign_key: true
  	add_column :localidades, :codigo_postal, :string
  end
end
