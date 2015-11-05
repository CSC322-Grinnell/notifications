class RemoveClassroomFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :classroom
  end

  def down
    add_column :users, :classroom, :string
  end
end
