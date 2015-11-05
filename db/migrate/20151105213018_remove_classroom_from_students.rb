class RemoveClassroomFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :classroom
  end

  def down
    add_column :students, :classroom, :string
  end
end
