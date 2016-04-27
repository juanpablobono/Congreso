class ChangeNameColumnInLocalidades < ActiveRecord::Migration
  def change
  	rename_column :localidades, :name, :nombre
  end
end
