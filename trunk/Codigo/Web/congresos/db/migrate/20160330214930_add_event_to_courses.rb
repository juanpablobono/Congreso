class AddEventToCourses < ActiveRecord::Migration
  def change
    add_reference :courses, :event, index: true, foreign_key: true
  end
end
