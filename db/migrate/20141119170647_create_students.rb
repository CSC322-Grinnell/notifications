class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :Student_Name
      t.string :Parent_Name
      t.string :Phone_Number
      t.string :Email
      t.string :can_text
      t.string :classroom_name

      t.timestamps
    end
  end
end
