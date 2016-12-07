class UpdateStudents < ActiveRecord::Migration
  def up
    remove_column :students, :Phone_Number
    remove_column :students, :Email
    remove_column :students, :classroom_name
    remove_column :students, :can_text
  end

  def down
    add_column :students, :Phone_Number, :string
    add_column :students, :Email, :string
    add_column :students, :classroom_name, :string
    add_column :students, :can_text, :boolean
  end
end
