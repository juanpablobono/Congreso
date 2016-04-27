class ChangeDateFormatInCourses < ActiveRecord::Migration
  def up
  	change_column :courses, :dia_hora, :datetime, default: Time.now

  	Course.reset_column_information
  	Course.all.each do |course|
  		course.update_attribute :dia_hora, Time.now
  	end
  end

  def down
  	change_column :courses, :dia_hora, :string
  
  	Course.reset_column_information
  	Course.all.each do |course|
  		course.update_attribute :dia_hora, ""
  	end
  end
end
