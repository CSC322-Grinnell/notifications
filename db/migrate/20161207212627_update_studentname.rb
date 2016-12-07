class UpdateStudentname < ActiveRecord::Migration
  def up
    rename_column :students, :Student_Name, :student_name
  end

  def down
    rename_column :students, :studnet_name, :Student_Name
  end
end
