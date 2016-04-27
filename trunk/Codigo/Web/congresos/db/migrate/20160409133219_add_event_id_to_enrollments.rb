class AddEventIdToEnrollments < ActiveRecord::Migration
  def change
    add_reference :enrollments, :event, index: true, foreign_key: true
  end
end
