class CreateStudentClassroomAssociations < ActiveRecord::Migration
  def change
    create_table :student_classroom_associations do |t|
      t.integer :student_id
      t.integer :classroom_id

      t.timestamps
    end
  end
end
