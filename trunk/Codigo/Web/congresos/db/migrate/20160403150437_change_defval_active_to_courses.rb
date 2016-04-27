class ChangeDefvalActiveToCourses < ActiveRecord::Migration
  def change
  	change_column :courses, :activo, :boolean, default: true
  end
end
