class RemoveParentNamefromstudents < ActiveRecord::Migration
  def up
    remove_column :students, :Parent_Name
  end

  def down
    add_column :students, :Parent_Name, :string
  end
end
