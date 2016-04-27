class ChangeDateFormatInEvents < ActiveRecord::Migration
  def up
  	change_column :events, :fecha_inicio, :date, default: Time.now
  	change_column :events, :fecha_fin, :date, default: Time.now 

  	Event.reset_column_information
  	Event.all.each do |event|
  		event.update_attribute :fecha_inicio, Time.now
  		event.update_attribute :fecha_fin, Time.now
  	end
  end

  def down
  	change_column :events, :fecha_inicio, :string
  	change_column :events, :fecha_fin, :string

  	Event.reset_column_information
  	Event.all.each do |event|
  		event.update_attribute :fecha_inicio, ""
  		event.update_attribute :fecha_fin, ""
  	end
  end
end
