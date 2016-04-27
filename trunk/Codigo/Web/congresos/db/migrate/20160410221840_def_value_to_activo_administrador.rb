class DefValueToActivoAdministrador < ActiveRecord::Migration
  def change
  	change_column :administradores, :activo, :boolean, default: true
  end
end
