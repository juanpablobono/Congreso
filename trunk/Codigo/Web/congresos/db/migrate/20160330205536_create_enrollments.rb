class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :fecha_alta

      t.timestamps null: false
    end
  end
end
