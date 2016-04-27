class AddUserToEnrollments < ActiveRecord::Migration
  def change
    add_reference :enrollments, :user, index: true, foreign_key: true
  end
end
